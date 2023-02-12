import 'package:superformula_test/data/model/qr_code_seed_model.dart';
import 'package:superformula_test/domain/entities/qr_code_seed_entity.dart';

class QrCodeDataMapper {
  static QrCodeSeedEntity modelToEntity(QrCodeSeedModel model) =>
      QrCodeSeedEntity(seed: model.seed, expiresAt: model.expiresAt);
}
