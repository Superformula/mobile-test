import 'package:flutter_mobile_test/api/qr_code_api.dart';
import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/models/qr_code_model.dart';
import 'package:flutter_mobile_test/models/validation_model.dart';
import 'package:rxdart/rxdart.dart';

class QrCodeRepository {
  final _api = locator<QrCodeApi>();
  final refreshSubject = PublishSubject();

  Observable<QrCode> get qrCodeObservable => refreshSubject
      .startWith(null)
      .asyncMap((_) => _api.getApiQrCode())
      .map((response) => QrCode.fromJson(response.data))
      .asBroadcastStream();

  Observable<Validation> validateQrCode(String code) => Observable.just(null)
      .asyncMap((_) => _api.validateQrCode(code))
      .map((response) => Validation.fromJson(response.data));
}
