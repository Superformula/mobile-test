import 'package:barcode_scan/barcode_scan.dart';
import 'package:mockito/mockito.dart';

class BarcodeWrapper {
  Future<String> scan() async {
    try {
      return await BarcodeScanner.scan();
    } catch (e) {
      return null;
    }
  }
}

class BarcodeMockWrapper extends Mock implements BarcodeWrapper {}
