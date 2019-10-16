import 'package:flutter_mobile_test/api/qr_code_api.dart';
import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/models/qr_code_models.dart';
import 'package:rxdart/rxdart.dart';

class QrCodeRepository {
  final _api = locator<QrCodeApi>();

  Observable<QrCode> get qrCodeObservable =>
      Observable.fromFuture(_api.getMockApiQrCode)
          .map((response) => QrCode.fromJson(response.data))
          .asBroadcastStream();
}
