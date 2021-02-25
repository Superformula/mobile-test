import 'dart:convert';
import 'package:test/test.dart';

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import 'package:network_manager/network_manager.dart';
import 'package:errors/errors.dart';

import 'package:qr_generator/qr_generator.dart';

import '../../fixtures/fixture_reader.dart';

class MockRemoteDataSource extends Mock implements IRemoteDataSource {}

class MockLocalDataSource extends Mock implements ILocalDataSource {}

class MockNetworkManager extends Mock implements INetworkManager {}

void main() {
  QrGeneratorRepository repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkManager mockNetworkManager;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkManager = MockNetworkManager();
    repository = QrGeneratorRepository(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkManager: mockNetworkManager,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkManager.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkManager.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getSeed', () {
    final tSeedModel =
        SeedModel.fromJson(json.decode(fixture('seed_local.json')));
    final Seed tSeed = tSeedModel;

    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkManager.isConnected).thenAnswer((_) async => true);
        // act
        await repository.getSeed();
        // assert
        verify(mockNetworkManager.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        '''
          should return remote data when the call to remote data source is successful
        ''',
        () async {
          // arrange
          when(mockRemoteDataSource.getSeed())
              .thenAnswer((_) async => tSeedModel);
          // act
          final result = await repository.getSeed();
          // assert
          verify(mockRemoteDataSource.getSeed());
          expect(result, equals(Right(tSeed)));
        },
      );

      test(
        '''
          should return server failure when the call to remote data source is unsuccessful
        ''',
        () async {
          // arrange
          when(mockRemoteDataSource.getSeed()).thenThrow(ServerException());
          // act
          final result = await repository.getSeed();
          // assert
          verify(mockRemoteDataSource.getSeed());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return locally generated seed',
        () async {
          // arrange
          when(mockLocalDataSource.getLocalGeneratedSeed())
              .thenAnswer((_) async => tSeedModel);
          // act
          final result = await repository.getSeed();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLocalGeneratedSeed());
          expect(result, equals(Right(tSeed)));
        },
      );

      test(
        'should return CacheFailure when local seed is null',
        () async {
          // arrange
          when(mockLocalDataSource.getLocalGeneratedSeed())
              .thenThrow(CacheException());
          // act
          final result = await repository.getSeed();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLocalGeneratedSeed());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
