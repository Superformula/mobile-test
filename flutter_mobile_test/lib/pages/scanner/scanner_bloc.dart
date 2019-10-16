import 'package:flutter_mobile_test/barcode/barcode_wrapper.dart';
import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/repository/qr_code_repository.dart';
import 'package:rxdart/rxdart.dart';

class ScannerBloc {
  final BarcodeWrapper _barcodeWrapper;
  final PublishSubject<void> _refreshSubject = PublishSubject();
  final PublishSubject<void> _validationSubject = PublishSubject();
  final QrCodeRepository _repository = locator();

  Observable<String> scannerObservable;
  Observable<bool> validateCodeObservable;

  ScannerBloc(this._barcodeWrapper) {
    scannerObservable = _refreshSubject
        .startWith(null)
        .asyncMap((_) => _barcodeWrapper.scan())
        .publishValue()
        .autoConnect();

    validateCodeObservable = _validationSubject.switchMap((_) =>
        scannerObservable
            .take(1)
            .switchMap((code) => _repository.validateQrCode(code))
            .map((validation) => validation.isValid));
  }

  validate() => _validationSubject.add(null);

  refresh() => _refreshSubject.add(null);
}
