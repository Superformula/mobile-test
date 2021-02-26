import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:meta/meta.dart';
import 'package:network_manager/network_manager.dart';

import '../../domain/domain.dart';

import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';

/// QrGenerator repository implementation
class QrGeneratorRepository implements IQrGeneratorRepository {
  /// QrGenerator repository constructor
  QrGeneratorRepository({
    @required ILocalDataSource localDataSource,
    @required IRemoteDataSource remoteDataSource,
    @required INetworkManager networkManager,
  })  : assert(localDataSource != null),
        assert(remoteDataSource != null),
        assert(networkManager != null),
        _networkManager = networkManager,
        _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  final INetworkManager _networkManager;
  final ILocalDataSource _localDataSource;
  final IRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Seed>> getSeed() async {
    if (await _networkManager.isConnected) {
      try {
        final remoteSeed = await _remoteDataSource.getSeed();
        return Right(remoteSeed);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localSeed = await _localDataSource.getLocalGeneratedSeed();
        return Right(localSeed);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
