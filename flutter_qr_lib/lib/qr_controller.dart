import 'package:flutter/services.dart';

typedef void QRControllerCreated(QRController controller);

class QRController {
  MethodChannel _channel;

  QRController(int id) {
    _channel = MethodChannel('qr_native_$id');
  }

  Future<void> loadSeed(String seed) async {
    assert(seed != null);
    return _channel.invokeMethod('loadSeed', {'seed': seed});
  }
}
