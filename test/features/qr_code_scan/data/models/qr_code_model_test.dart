import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/models/qr_code_model.dart';

import '../../mocks/mocks.dart';

void main() {
  group('QrCodeModel |', () {
    test('should return the correct model from a map', () {
      final QrCodeModel qrCodeModel =
          QrCodeModel.fromMap(QrCodeScanMocks.qrCodeResponseMap);

      expect(qrCodeModel, equals(QrCodeScanMocks.qrCodeModel));
    });
  });
}
