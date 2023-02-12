import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/domain/entities/qr_code_seed_entity.dart';

abstract class QrCodeSeedRepository {
  Future<Result<QrCodeSeedEntity>> getSeed();
}
