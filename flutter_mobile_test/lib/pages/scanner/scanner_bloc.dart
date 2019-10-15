import 'package:flutter_mobile_test/barcode/barcode_wrapper.dart';
import 'package:rxdart/rxdart.dart';

class BarcodeBloc {
  final BarcodeWrapper _barcodeWrapper = BarcodeWrapper();

  Observable<String> scannerObservable;

  BarcodeBloc() {
    scannerObservable = Observable.fromFuture(_barcodeWrapper.scan());
  }

  scan() {
    _barcodeWrapper.scan();
  }
}