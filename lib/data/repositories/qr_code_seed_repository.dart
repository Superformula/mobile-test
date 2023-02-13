import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/data/data_sources/qr_code_seed_data_source.dart';
import 'package:superformula_test/data/errors/exception.dart';
import 'package:superformula_test/data/errors/failure.dart';
import 'package:superformula_test/data/mappers/qr_code_data_mapper.dart';
import 'package:superformula_test/domain/entities/qr_code_seed_entity.dart';
import 'package:superformula_test/domain/repositories/qr_code_seed_repository.dart';

class QrCodeSeedRepositoryImpl implements QrCodeSeedRepository {
  final QrCodeSeedDataSource dataSource;

  QrCodeSeedRepositoryImpl(this.dataSource);

  @override
  Future<Result<QrCodeSeedEntity>> getSeed() async {
    try {
      final model = await dataSource.getSeed();

      return Result.success(QrCodeDataMapper.modelToEntity(model));
    } on DataSourceException catch (e) {
      return Result.failure(RepositoryFailure(e.message));
    }
  }

  @override
  Future<Result<bool>> validateQRCode() async {
    final isValid = await dataSource.validateQRCode();

    return Result.success(isValid);
  }
}
