import 'package:qrcodevalidator/domain/entities/qr_code.dart';

abstract class QRCodeRepository {
  Future<QRCode> getQRCode();
  bool validateQRCode(QRCode qrCode, DateTime now);
}
