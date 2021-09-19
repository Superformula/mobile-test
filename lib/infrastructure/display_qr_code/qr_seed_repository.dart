import 'package:injectable/injectable.dart';
import 'package:superformula_mobile_test/domain/core/exceptions.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/entities/qr_seed.dart';
import 'package:superformula_mobile_test/domain/core/either.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_local_data_source.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_remote_data_source.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_repository.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/qr_seed_failure.dart';
import 'package:superformula_mobile_test/domain/platform/i_network_info.dart';

import '../../locator.dart';

@Injectable(as: IQrSeedRepository)
class QrSeedRepository implements IQrSeedRepository {
  @override
  Future<Either<QrSeedFailure, QrSeed>> getQrCodeSeed() async {
    final remoteDataSource = locator<IQrCodeRemoteDataSource>();
    final localDataSource = locator<IQrCodeLocalDataSource>();
    final networkInfo = locator<INetworkInfo>();

    // TODO: Finish lambda implementation and use data comeing from the server

    // Stub wait and response
    // await Future<void>.delayed(const Duration(seconds: 3));
    const stubResponse = {
      'seed': 'd43397d129c3de9e4b6c3974c1c16d1f',
      'expires_at': '1979-11-12T13:10:42.24Z'
    };

    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getQrCodeSeed();
        await localDataSource.cacheQrSeed(result);
        return Either.right(result.toDomain());
      } on ServerException {
        return const Either.left(QrSeedFailure.serverFailure());
      } on ResponseFormatException {
        return const Either.left(QrSeedFailure.serverFailure());
      }
    } else {
      try {
        final cached = await localDataSource.getLastQrSeed();
        return Either.right(cached.toDomain());
      } on CacheException {
        return const Either.left(QrSeedFailure.cacheFailure());
      }
    }
  }

  @override
  Future<Either<QrSeedFailure, void>> validateQrCodeData() {
    // TODO: implement validateQrCodeData
    throw UnimplementedError();
  }
}
