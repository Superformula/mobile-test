import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:bloc/bloc.dart';
import 'qr_scanner_state.dart';

///Cubit State Hanlder
class QrScannerCubit extends Cubit<QrScannerState> {
  ///Create an instace of `Cubit` with [QrScannerState]
  QrScannerCubit() : super(const Initial());

  ///Get seed from api
  Future<void> scanQr() async {
    try {
      final code = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      emit(Data(code: code));
    } on PlatformException {
      emit(const Error());
    }
  }
}
