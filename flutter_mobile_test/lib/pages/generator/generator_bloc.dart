import 'package:flutter_mobile_test/repository/qr_code_repository.dart';
import 'package:rxdart/rxdart.dart';

class GeneratorBloc {
  Observable<String> qrCodeSeedObservable;
  Observable<int> timerObservable;

  GeneratorBloc(QrCodeRepository repository) {
    qrCodeSeedObservable = repository.qrCodeObservable
        .map((qrCode) => qrCode.seed)
        .asBroadcastStream();

    final periodicObservable =
        Observable.periodic(Duration(seconds: 1), (value) => value).take(20);

    timerObservable = Observable.just(20).switchMap(
        (initial) => periodicObservable.map((period) => initial - period));
  }
}
