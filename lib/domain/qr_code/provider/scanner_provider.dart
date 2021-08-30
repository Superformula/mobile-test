import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:superformula_test/core/service_locator.dart';
import 'package:superformula_test/domain/qr_code/model/validator_model.dart';
import 'package:superformula_test/domain/qr_code/repository/qr_code_repo.dart';

class ScannerProvider extends ChangeNotifier {
  final RestClient client = ServiceLocator.locator<RestClient>();

  ScannerProvider();

  String? result = '';
  String? format = '';

///computes the values of the Barcode data and assign them accordingly
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

//posts the value of the scanned QR to the endpoint
  Future<bool> submitQR() async {
    QrValidate validateQR = QrValidate();
    try {
        validateQR.qrVal = result;
        await client.validateQR(validateQR);
      return true;
    } catch (e) {
      return false;
    }
  }
}
