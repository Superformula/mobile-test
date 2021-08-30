import 'dart:async';

import 'package:qr_generator/models/qr-response-models.dart';
import 'package:qr_generator/providers/bloc-provider.dart';
import 'package:qr_generator/services/app-backend-client.dart';

class QRGenerationBloc implements Bloc {

  final AppBackendClient _backendClient;

  QRGenerationBloc(this._backendClient);


  StreamController<QRSeed?> _qrSeedController = StreamController();
  StreamController<int> _qrExpirationTimerController = StreamController.broadcast();

  // inputs
  Function(QRSeed?) get _setQRData => _qrSeedController.sink.add;
  Function(int) get _setRemainingSecondsToCodeExpiration => _qrExpirationTimerController.sink.add;

  // outputs
  Stream<QRSeed?> get qrDataStream => _qrSeedController.stream;
  Stream<int> get qrExpirationTimerStream => _qrExpirationTimerController.stream;

  Timer? _expirationTimer;

  void dispose() {
    _qrSeedController.close();
    _qrExpirationTimerController.close();
    _expirationTimer?.cancel();
  }

  Future<void> subscribeToGeneratedCode() async {
    // drain the stream to show new code being
    // fetched if auto updating
    _setQRData(null);

    try {
      QRSeed response = await _backendClient.getGeneratedSeed();
      if(DateTime.now().isAfter(response.expirationDate)) {
        _qrSeedController.addError("Code is expired");
      } else {
        _setQRData(response);
        _startExpirationTimer(response.expirationDate);
      }
    } catch (e) {
      _qrSeedController.addError(e);
    }
  }

  Future<void> _startExpirationTimer(DateTime expirationDate) async {
    if(DateTime.now().isAfter(expirationDate)) {
        _qrExpirationTimerController.addError("Code has expired");
    } else {
      _expirationTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        int secondsToExpiration = expirationDate.difference(DateTime.now()).inSeconds;
        if(secondsToExpiration <= 0) {
          _qrExpirationTimerController.addError("Code has expired");
          subscribeToGeneratedCode();
          timer.cancel();
        } else {
          _setRemainingSecondsToCodeExpiration(expirationDate.difference(DateTime.now()).inSeconds);
        }
      });
    }
  }
}