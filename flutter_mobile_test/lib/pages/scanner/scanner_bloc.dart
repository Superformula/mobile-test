import 'package:flutter_mobile_test/barcode/barcode_wrapper.dart';
import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/models/validation_model.dart';
import 'package:flutter_mobile_test/repository/qr_code_repository.dart';
import 'package:rxdart/rxdart.dart';

class BarcodeBloc {
  final BarcodeWrapper _barcodeWrapper;
  final PublishSubject<void> _refreshSubject = PublishSubject();
  final PublishSubject<void> _validationSubject = PublishSubject();
  final QrCodeRepository _repository = locator();

  Observable<String> scannerObservable;
  Observable<bool> validateCodeObservable;

  BarcodeBloc(this._barcodeWrapper) {
    scannerObservable = _refreshSubject
        .startWith(null)
        .asyncMap((_) => _barcodeWrapper.scan())
        .asBroadcastStream();

    validateCodeObservable = _validationSubject
        .withLatestFrom(scannerObservable, (_, String code) => code)
        .switchMap((code) => _repository.validateQrCode(code))
        .map((validation) => validation.isValid)
        .skip(1);
  }

  validate() => _validationSubject.add(null);

  refresh() => _refreshSubject.add(null);
}
