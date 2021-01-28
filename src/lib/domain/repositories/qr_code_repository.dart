import 'package:qrcodevalidator/domain/entities/qr_code.dart';

abstract class QRCodeRepository {
  Future<QRCode> getQRCode();
  Future<bool> validateQRCode(QRCode qrCode, DateTime now);
}
