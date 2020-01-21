import 'package:flutter_test/flutter_test.dart';
import 'package:sftest_flutter/models/qrdata.dart';

void main() {
  test('QRData object should be created from parameters', () {
    final qr = QRData(
      'abcdefghijklmnopqstuvwxyz123456',
      DateTime.parse('1969-07-20T10:17z')
    );

    expect(qr.seed, "abcdefghijklmnopqstuvwxyz123456");

    expect(qr.expiresAt, DateTime.parse('1969-07-20T10:17z'));
  });

  test('QRData object should be created from JSON', () {
    final json = {
      'seed': 'abcdefghijklmnopqstuvwxyz123456',
      'expiresAt': '1969-07-20T10:17z'
    };
      
    final qr = QRData.fromJson(json);

    expect(qr.seed, "abcdefghijklmnopqstuvwxyz123456");

    expect(qr.expiresAt, DateTime.parse('1969-07-20T10:17z'));
  });
}
