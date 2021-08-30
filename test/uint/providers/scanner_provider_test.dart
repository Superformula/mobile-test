import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:superformula_test/core/service_locator.dart';
import 'package:superformula_test/domain/qr_code/provider/scanner_provider.dart';

void main() async {
  await ServiceLocator.register();
  group('Tests on the clear all function in the Scanner Provider', () {
    final scannerProvider = ScannerProvider();
    test('Format Value Test', () {
      final expected = null;
      scannerProvider.format = 'Some Format Value';
      scannerProvider.clearData();
      expect(scannerProvider.format, expected);
    });

    test('Result Value Test', () {
      final expected = null;
      scannerProvider.result = 'Some Result Value';
      scannerProvider.clearData();
      expect(scannerProvider.format, expected);
    });
  });

  group('Tests on the Resolve Data Scan function in the Scanner Provider', () {
    final scannerProvider = ScannerProvider();
    test('Test for the correct format value', () {
      scannerProvider.resolveDataScan(Barcode('', BarcodeFormat.codabar, []));
      final expected = 'codabar';
      expect(scannerProvider.format, expected);
    });

    test('Test for the correct result value', () {
      scannerProvider.resolveDataScan(
          Barcode('This is the result', BarcodeFormat.qrcode, []));
      final expected = 'This is the result';
      expect(scannerProvider.result, expected);
    });
  });

  group('Test endpoint call in Scanner Provider', () {
    final scannerProvider = ScannerProvider();
    test('Test for the successful post call', () {
      scannerProvider
          .resolveDataScan(Barcode('Value', BarcodeFormat.qrcode, []));
      final expected = Future.value(true);
      when(scannerProvider.submitQR().then((_) async => expected));
    });
  });
}
