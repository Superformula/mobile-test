import 'dart:async';

import 'package:rxdart/rxdart.dart';

class BarcodeBloc {
  final PublishSubject<String> _scannerSuccessSubject = PublishSubject();

  Observable<String> scannerObservable;

  StreamSink<String> scannerSink;

  BarcodeBloc() {
    scannerObservable = _scannerSuccessSubject.stream;

    scannerSink = _scannerSuccessSubject.sink;
  }

  dispose() {
    _scannerSuccessSubject.close();
    scannerSink.close();
  }
}
