import 'package:superformula_leandro/features/qr_code_scan/data/models/qr_code_model.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/entities/qr_code_entity.dart';

sealed class QrCodeScanMocks {
  static final QrCodeEntity qrCodeEntity = QrCodeEntity(
    seed: 'd43397d129c3de9e4b6c3974c1c16d1f',
    expiresAt: DateTime(2024, 1, 1),
  );
  static final QrCodeEntity qrCodeEntityEqual = QrCodeEntity(
    seed: 'd43397d129c3de9e4b6c3974c1c16d1f',
    expiresAt: DateTime(2024, 1, 1),
  );
  static final QrCodeModel qrCodeModel = QrCodeModel(
    seed: 'd43397d129c3de9e4b6c3974c1c16d1f',
    expiresAt: DateTime(2024, 1, 1),
  );
  static final Map<String, dynamic> qrCodeResponseMap = <String, dynamic>{
    'seed': 'd43397d129c3de9e4b6c3974c1c16d1f',
    'expires_at': '2024-01-01T00:00:00.000',
  };
}
