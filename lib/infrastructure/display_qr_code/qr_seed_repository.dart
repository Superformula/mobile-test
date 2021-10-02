import 'package:injectable/injectable.dart';
import 'package:superformula_mobile_test/domain/core/either.dart';
import 'package:superformula_mobile_test/domain/core/exceptions.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/entities/qr_seed.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_local_data_source.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_remote_data_source.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_repository.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/qr_seed_failure.dart';
import 'package:superformula_mobile_test/domain/platform/i_network_info.dart';

import '../../locator.dart';

@Injectable(as: IQrSeedRepository)
class QrSeedRepository implements IQrSeedRepository {
  final _remoteDataSource = locator<IQrCodeRemoteDataSource>();
  final _localDataSource = locator<IQrCodeLocalDataSource>();
  final _networkInfo = locator<INetworkInfo>();

  @override
  Future<Either<QrSeedFailure, QrSeed>> getQrCodeSeed() async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await _remoteDataSource.getQrCodeSeed();
        await _localDataSource.cacheQrSeed(result);
        return Either.right(result.toDomain());
      } on ServerException {
        return const Either.left(QrSeedFailure.serverFailure());
      } on ResponseFormatException {
        return const Either.left(QrSeedFailure.serverFailure());
      }
    } else {
      try {
        final cached = await _localDataSource.getLastQrSeed();
        return Either.right(cached.toDomain());
      } on CacheException {
        return const Either.left(QrSeedFailure.cacheFailure());
      }
    }
  }

  @override
  Future<Either<QrSeedFailure, bool>> validateQrCodeData(String data) async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await _remoteDataSource.validateQrCodeData(data);
        return Either.right(result);
      } on ServerException {
        return const Either.left(QrSeedFailure.serverFailure());
      } on ResponseFormatException {
        return const Either.left(QrSeedFailure.serverFailure());
      }
    } else {
      // We cant validate without connection
      return const Either.left(QrSeedFailure.connectivityFailure());
    }
  }
}
