import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/data/data_sources/qr_code_local_data_source.dart';
import 'package:superformula_test/data/data_sources/qr_code_remote_data_source.dart';
import 'package:superformula_test/data/errors/exception.dart';
import 'package:superformula_test/data/errors/failure.dart';
import 'package:superformula_test/data/mappers/qr_code_data_mapper.dart';
import 'package:superformula_test/domain/entities/qr_code_entity.dart';
import 'package:superformula_test/domain/repositories/qr_code_repository.dart';

class QRCodeRepositoryImpl implements QRCodeRepository {
  final QRCodeRemoteDataSource remoteDataSource;
  final QRCodeLocalDataSource localDataSource;

  QRCodeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Result<QRCodeEntity>> getSeed() async {
    try {
      final model = await remoteDataSource.getSeed();

      return Result.success(QRCodeDataMapper.modelToEntity(model));
    } on DataSourceException {
      final localModel = await localDataSource.getSeed();
      return Result.success(QRCodeDataMapper.modelToEntity(localModel));
    } on Exception catch (e) {
      return Result.failure(RepositoryFailure(e.toString()));
    }
  }

  @override
  Future<Result<bool>> validateQRCode() async {
    final isValid = await remoteDataSource.validateQRCode();

    return Result.success(isValid);
  }
}
