import 'package:flutter_mobile_test/repository/qr_code_repository.dart';
import 'package:rxdart/rxdart.dart';

class GeneratorBloc {
  Observable<String> qrCodeSeedObservable;
  Observable<int> timerObservable;

  GeneratorBloc(QrCodeRepository repository) {
    qrCodeSeedObservable = repository.qrCodeObservable
        .map((qrCode) => qrCode.seed)
        .onErrorReturn('');

    timerObservable = repository.qrCodeObservable
        .map((qrCode) => qrCode.expireTime)
        .switchMap((initial) =>
            Observable.periodic(Duration(seconds: 1), (value) => value + 1)
                .startWith(0)
                .take(initial + 1)
                .map((period) => initial - period));
  }
}
