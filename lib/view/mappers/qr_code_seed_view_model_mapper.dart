import 'package:superformula_test/data/model/qr_code_seed_model.dart';
import 'package:superformula_test/domain/entities/qr_code_seed_entity.dart';
import 'package:superformula_test/view/models/qr_code_seed_view_model.dart';

class QrCodeSeedViewModelMapper {
  static QrCodeSeedViewModel entityToViewModel(QrCodeSeedEntity entity) =>
      QrCodeSeedViewModel(seed: entity.seed, expiresAt: entity.expiresAt);
}
