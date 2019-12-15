import 'dart:async';

import 'package:superformula/bloc/bloc.dart';
import 'package:superformula/data_layer/qr_seed.dart';
import 'package:superformula/data_layer/seed_respository.dart';

class QRBloc implements Bloc {
  final _qrController = StreamController<QrSeed>();
  final _expiryStream = StreamController<String>();

  final SeedRepository repository;

  Stream<QrSeed> get qrStream => _qrController.stream;
  Stream<String> get expiryStream => _expiryStream.stream;

  QRBloc(this.repository);

  void startRequestingCodes() async {
    final seed = await repository.fetchLatestSeed();
    _qrController.sink.add(seed);
    _scheduleNextFetch(seed);
    _sendExpiryEvents(seed);
  }

  void _sendExpiryEvents(QrSeed seed) async {
    final validity = seed.validDuration;
    final seconds = validity.inSeconds;

    final unit = seconds == 0 ? 'second' : 'seconds';
    final message = '${seconds + 1} $unit';
    _expiryStream.sink.add(message);

    if (seconds < 1) {
      return;
    }

    await Future.delayed(Duration(seconds: 1));
    _sendExpiryEvents(seed);
  }

  void _scheduleNextFetch(QrSeed seed) async {
    final validity = seed.validDuration;
    await Future.delayed(validity);
    startRequestingCodes();
  }

  void dispose() {
    _qrController.close();
    _expiryStream.close();
  }
}
