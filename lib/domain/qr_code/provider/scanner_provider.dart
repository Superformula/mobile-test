import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerProvider extends ChangeNotifier {
  ScannerProvider();

  String? result = '';
  String? format = '';

  Future<void> resolveDataScan(Barcode data) {
    format = describeEnum(data.format);
    result = data.code;
    notifyListeners();
    return Future.value();
  }

  void clearData() {
    format = null;
    result = null;
    notifyListeners();
  }
}
