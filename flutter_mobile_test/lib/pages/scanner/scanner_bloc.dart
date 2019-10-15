import 'package:flutter_mobile_test/barcode/barcode_wrapper.dart';
import 'package:rxdart/rxdart.dart';

class BarcodeBloc {
  final BarcodeWrapper _barcodeWrapper;
  final PublishSubject<void> _refreshSubject = PublishSubject();

  Observable<String> scannerObservable;

  BarcodeBloc(this._barcodeWrapper) {
    scannerObservable =
        _refreshSubject.startWith(null).asyncMap((_) => _barcodeWrapper.scan());
  }

  refresh() => _refreshSubject.add(null);
}
