import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() {
  group('QrCodeEntity |', () {
    test('should be equal', () {
      expect(
        QrCodeScanMocks.qrCodeEntity,
        equals(QrCodeScanMocks.qrCodeEntityEqual),
      );
    });
    test('should have the same hash code', () {
      expect(
        QrCodeScanMocks.qrCodeEntity.hashCode,
        equals(QrCodeScanMocks.qrCodeEntityEqual.hashCode),
      );
    });
  });
}
