import 'package:qrcodevalidator/domain/entities/qr_code.dart';
import 'package:qrcodevalidator/domain/repositories/qr_code_repository.dart';

class DataQRCodeRepository implements QRCodeRepository {
  Future<QRCode> getQRCode() {
    // TODO.
    return Future.delayed(Duration(seconds: 1), () {
      return QRCode(
        seed: '${DateTime.now().millisecondsSinceEpoch}',
        expiresAt: DateTime.now().add(Duration(seconds: 4)),
      );
    });
  }

  /// Validate QR Code.
  @override
  Future<bool> validateQRCode(QRCode qrCode, DateTime now) {
    // If needed, this can be changed for server side validation.
    return Future.value(qrCode.isValid(now));
  }
}
