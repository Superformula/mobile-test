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
  bool validateQRCode(QRCode qrCode, DateTime now) {
    return qrCode.isValid(now);
  }
}
