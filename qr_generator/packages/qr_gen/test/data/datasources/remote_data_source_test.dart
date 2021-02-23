import 'package:dio/dio.dart';
import 'package:errors/errors.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_gen/qr_gen.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements Dio {}

void main() {
  MockClient client;
  DioDataSource dataSource;

  setUp(() {
    client = MockClient();
    dataSource = DioDataSource(client: client, url: '');
  });

  group('getSeed', () {
    final tSeed = SeedModel(
      seed: 'myRandomSeed',
      expiresAt: DateTime.now().add(const Duration(seconds: 30)),
    );

    void successSetup() {
      when(client.get(any)).thenAnswer(
        (_) async => Response(data: tSeed.toJson(), statusCode: 200),
      );
    }

    void failureSetup() {
      when(client.get(any)).thenAnswer(
        (_) async => Response(data: 'Something went wrong', statusCode: 404),
      );
    }

    test(
      'Should perform GET request to api/seed using HTTP client.',
      () async {
        // setup -> create the object to test
        successSetup();

        // side effects -> collect the result to test
        await dataSource.getSeed();

        // verifications -> verify other actions that should(n't) happen
        verify(client.get(any));
      },
    );

    test(
      'Should return a new Seed when request is successful.',
      () async {
        // setup -> create the object to test
        successSetup();

        // side effects -> collect the result to test
        final result = await dataSource.getSeed();

        // expectations -> compare result to expected value
        expect(result, equals(tSeed));
      },
    );

    test(
      'Should throw ServerException when statusCode is different than 200.',
      () {
        // setup -> create the object to test
        failureSetup();
        // side effects -> collect the result to test
        final result = dataSource.getSeed();
        // expectations -> compare result to expected value
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });
}
