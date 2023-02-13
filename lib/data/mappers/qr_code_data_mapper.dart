import 'package:superformula_test/data/model/qr_code_model.dart';
import 'package:superformula_test/domain/entities/qr_code_entity.dart';

class QRCodeDataMapper {
  static QRCodeEntity modelToEntity(QRCodeModel model) =>
      QRCodeEntity(seed: model.seed, expiresAt: model.expiresAt);
}
