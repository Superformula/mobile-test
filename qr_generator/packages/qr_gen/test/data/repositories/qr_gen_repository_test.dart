import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:mockito/mockito.dart';
import 'package:network_manager/network_manager.dart';
import 'package:qr_gen/qr_gen.dart';
import 'package:test/test.dart';

class MockRemoteDataSource extends Mock implements IRemoteDataSource {}

class MockNetworkManager extends Mock implements NetworkManager {}

void main() {
  QrGenRepository repository;
  MockRemoteDataSource dataSource;
  MockNetworkManager networkManager;

  setUp(() {
    dataSource = MockRemoteDataSource();
    networkManager = MockNetworkManager();

    repository = QrGenRepository(
      networkManager: networkManager,
      remoteDataSource: dataSource,
    );
  });

  void setDeviceConnected({bool isConnected = true}) {
    when(networkManager.isConnected).thenAnswer((_) async => isConnected);
  }

  test(
    'Should verify device is connected to network.',
    () async {
      // setup -> create the object to test
      setDeviceConnected();

      // side effects -> collect the result to test
      await repository.getSeed();

      // verifications -> verify other actions that should(n't) happen
      verify(networkManager.isConnected);
    },
  );

  group('getSeed', () {
    final tSeed = SeedModel(
      seed: 'myRandomSeed',
      expiresAt: DateTime.now().add(const Duration(seconds: 30)),
    );

    group('Device connected tests', () {
      test(
        'Should return Seed when datasource succeeds.',
        () async {
          setDeviceConnected();

          // setup -> create the object to test
          when(dataSource.getSeed()).thenAnswer((_) async => tSeed);

          // side effects -> collect the result to test
          final result = await repository.getSeed();

          // expectations -> compare result to expected value
          expect(result, equals(Right(tSeed)));

          // verifications -> verify other actions that should(n't) happen
          verify(dataSource.getSeed());
        },
      );

      test(
        'Should return ServerFailure when datasource fails.',
        () async {
          setDeviceConnected();

          // setup -> create the object to test
          when(dataSource.getSeed()).thenThrow(ServerException());

          // side effects -> collect the result to test
          final result = await repository.getSeed();

          // expectations -> compare result to expected value
          expect(result, equals(Left(ServerFailure())));

          // verifications -> verify other actions that should(n't) happen
          verify(dataSource.getSeed());
        },
      );
    });
  });
}
