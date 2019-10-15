import 'package:flutter_mobile_test/barcode/barcode_wrapper.dart';
import 'package:rxdart/rxdart.dart';

class BarcodeBloc {
  final BarcodeWrapper _barcodeWrapper;
  final PublishSubject<void> _refreshSubject = PublishSubject();
  final PublishSubject<void> _validationSubject = PublishSubject();

  Observable<String> scannerObservable;
  Observable<String> validateCodeObservable;

  BarcodeBloc(this._barcodeWrapper) {
    scannerObservable = _refreshSubject
        .startWith(null)
        .asyncMap((_) => _barcodeWrapper.scan())
        .asBroadcastStream();

    validateCodeObservable = _validationSubject
        .withLatestFrom(scannerObservable, (_, String code) => code)
        .switchMap((code) => Observable.just("VALIDATION SUCCESS"));
  }

  validate() => _validationSubject.add(null);

  refresh() => _refreshSubject.add(null);
}
