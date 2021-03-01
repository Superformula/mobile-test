import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:meta/meta.dart';
import 'package:network_manager/network_manager.dart';

import '../../domain/entities/seed.dart';
import '../../domain/repositories/iqr_gen_repository.dart';

import '../datasources/remote/remote_data_source.dart';

/// QrGen repository implementation
class QrGenRepository implements IQrGenRepository {
  /// QrGen expects its datasource dependencies.
  QrGenRepository({
    @required INetworkManager networkManager,
    @required IRemoteDataSource remoteDataSource,
  })  : assert(networkManager != null),
        assert(remoteDataSource != null),
        _networkManager = networkManager,
        _remoteDataSource = remoteDataSource;

  final INetworkManager _networkManager;
  final IRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Seed>> getSeed() async {
    if (await _networkManager.isConnected) {
      try {
        final seed = await _remoteDataSource.getSeed();
        return Right(seed);
      } on ServerException {
        return Left(ServerFailure());
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
