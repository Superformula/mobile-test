import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class Deviceinfo {
  String _identifier = '';
  Future<String> getDeviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        _identifier = build.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        _identifier = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
    return _identifier;
  }

  deviceId() {
    if (_identifier != '') {
      return _identifier;
    }
  }
}
