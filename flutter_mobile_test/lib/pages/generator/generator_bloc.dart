import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/repository/qr_code_repository.dart';
import 'package:rxdart/rxdart.dart';

class GeneratorBloc {
  Observable<String> qrCodeSeedObservable;
  Observable<int> timerObservable;
  final _repository = locator<QrCodeRepository>();

  GeneratorBloc() {
    qrCodeSeedObservable = _repository.qrCodeObservable
        .map((qrCode) => qrCode.seed)
        .onErrorReturn('');

    timerObservable = _repository.qrCodeObservable
        .map((qrCode) => qrCode.expireTime)
        .switchMap((initial) =>
            Observable.periodic(Duration(seconds: 1), (value) => value + 1)
                .startWith(0)
                .take(initial + 1)
                .map((period) => initial - period))
        .onErrorReturn(0);
  }
}
