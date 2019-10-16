import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/repository/qr_code_repository.dart';
import 'package:rxdart/rxdart.dart';

class QrCodeBloc {
  Observable<String> qrCodeSeedObservable;
  Observable<int> timerObservable;
  final _repository = locator<QrCodeRepository>();

  QrCodeBloc() {
    qrCodeSeedObservable =
        _repository.qrCodeObservable.map((qrCode) => qrCode.seed);

    timerObservable = _repository.qrCodeObservable
        .map((qrCode) => DateTime.fromMicrosecondsSinceEpoch(
                DateTime.now().millisecondsSinceEpoch -
                    DateTime.parse(qrCode.expiresAt).millisecondsSinceEpoch)
            .second)
        .switchMap((initial) =>
            Observable.periodic(Duration(seconds: 1), (value) => value + 1)
                .startWith(0)
                .take(initial + 1)
                .map((period) => initial - period));
  }
}
