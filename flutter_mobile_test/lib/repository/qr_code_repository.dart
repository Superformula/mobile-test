import 'package:flutter_mobile_test/api/qr_code_api.dart';
import 'package:flutter_mobile_test/models/qr_code_models.dart';
import 'package:rxdart/rxdart.dart';

class QrCodeRepository {
  Observable<QrCode> qrCodeObservable;

  QrCodeRepository(QrCodeApi api) {
    qrCodeObservable = Observable.fromFuture(api.getMockApiQrCode)
        .map((response) => QrCode.fromJson(response.data));
  }
}
