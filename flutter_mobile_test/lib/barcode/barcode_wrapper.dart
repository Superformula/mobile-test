import 'package:barcode_scan/barcode_scan.dart';

class BarcodeWrapper {

  Future<String> scan() async {
    try {
      return await BarcodeScanner.scan();
    } catch (e){
      return null;
    }
  }
}