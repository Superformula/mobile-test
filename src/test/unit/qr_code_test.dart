import 'package:flutter_test/flutter_test.dart';
import 'package:qrcodevalidator/domain/entities/qr_code.dart';

void main() {
  group('QRCode', () {
    test('QR Code with past expiration should be invalid', () {
      var past = DateTime.parse('1999-12-30 23:59:59');
      var future = DateTime.parse('2000-01-01 00:00:00');

      var qrCode = QRCode(
        expiresAt: past,
      );

      expect(qrCode.isValid(future), false);
    });

    test('QR Code with future expiration should be valid', () {
      var past = DateTime.parse('1999-12-30 23:59:59');
      var future = DateTime.parse('2000-01-01 00:00:00');

      var qrCode = QRCode(
        expiresAt: future,
      );

      expect(qrCode.isValid(past), true);
    });

    test('QR Code with present expiration should be valid', () {
      var present = DateTime.parse('2000-01-01 00:00:00');

      var qrCode = QRCode(
        expiresAt: present,
      );

      expect(qrCode.isValid(present), true);
    });

    test('Remaining time should be correct', () {
      var present = DateTime.parse('2000-01-01 00:00:00');
      var future = DateTime.parse('2000-01-01 00:00:01');

      var expectedRemainingTime = future.difference(present);

      var qrCode = QRCode(
        expiresAt: future,
      );

      expect(qrCode.getRemainingTime(present), expectedRemainingTime);
    });

    test('Remaining time should be zero', () {
      var present = DateTime.parse('2000-01-01 00:00:00');
      var past = DateTime.parse('1999-12-30 23:59:59');

      var expectedRemainingTime = Duration(seconds: 0);

      var qrCode = QRCode(
        expiresAt: past,
      );

      expect(qrCode.getRemainingTime(present), expectedRemainingTime);
    });
  });
}
