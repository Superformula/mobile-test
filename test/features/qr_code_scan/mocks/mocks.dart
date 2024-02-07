import 'package:superformula_leandro/features/qr_code_scan/data/models/qr_code_model.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/entities/qr_code_entity.dart';

sealed class QrCodeScanMocks {
  static final QrCodeEntity qrCodeEntity = QrCodeEntity(
    seed: '5e3d',
    expireAt: DateTime(2024, 1, 1),
  );
  static final QrCodeEntity qrCodeEntityEqual = QrCodeEntity(
    seed: '5e3d',
    expireAt: DateTime(2024, 1, 1),
  );
  static final QrCodeModel qrCodeModel = QrCodeModel(
    seed: '5e3d',
    expireAt: DateTime(2024, 1, 1),
  );
  static final Map<String, dynamic> qrCodeResponseMap = <String, dynamic>{
    'seed': '5e3d',
    'expires_at': DateTime(2024, 1, 1),
  };
}
