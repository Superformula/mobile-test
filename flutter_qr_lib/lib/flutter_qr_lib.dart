
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterQrLib {
  static const MethodChannel _channel =
      const MethodChannel('flutter_qr_lib');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
