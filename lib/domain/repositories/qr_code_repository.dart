import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/domain/entities/qr_code_entity.dart';

abstract class QRCodeRepository {
  const QRCodeRepository();

  Future<Result<QRCodeEntity>> getSeed();
  Future<Result<bool>> validateQRCode();
}
