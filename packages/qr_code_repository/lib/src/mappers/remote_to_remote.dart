import 'package:domain_models/domain_models.dart';
import 'package:qr_generator_api/qr_generator_api.dart';

extension QrCodeRMtoDomain on QrCodeRM {
  QrCode toDomainModel() {
    return QrCode(
      seed: seed,
      expiresAt: expiresAt,
    );
  }
}
