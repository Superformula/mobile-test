import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

mixin ScanQRCodeDelegate {
  onSuccess(String data);
  onFailure(String errorMessage);
}

class ScanQRCodeViewModel {

  ScanQRCodeDelegate _delegate;

  Future<void> scan() async {
    try {
      var scanResult = await FlutterBarcodeScanner
          .scanBarcode("#ff6666", "Cancel", true, ScanMode.QR);
      _delegate.onSuccess(scanResult);
    } catch(error) {
      _delegate?.onFailure(error.toString());
    }
  }

  void setDelegate(ScanQRCodeDelegate delegate) {
    _delegate = delegate;
  }
}