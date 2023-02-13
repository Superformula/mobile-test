import 'package:superformula_test/domain/entities/qr_code_entity.dart';
import 'package:superformula_test/view/models/qr_code_view_model.dart';

class QRCodeViewModelMapper {
  static QRCodeViewModel entityToViewModel(QRCodeEntity entity) =>
      QRCodeViewModel(seed: entity.seed, expiresAt: entity.expiresAt);
}
