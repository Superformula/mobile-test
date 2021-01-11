import 'dart:io';
import 'package:device_info/device_info.dart';

class BaseService {
  DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  Future<String> get host async => await _getHost();

  Future<String> _getHost() {
    String value = '';
    // Android
    if (Platform.isAndroid) {
      return _deviceInfo.androidInfo.then((androidInfo) {
        if (androidInfo.isPhysicalDevice) {
          value = 'http://192.168.1.251'; // This is my local ip
        } else {
          value = 'http://10.0.2.2'; // android emulator
        }
        return value;
      });
    } // IOS
    else {
      return _deviceInfo.iosInfo.then((iosInfo) {
        if (iosInfo.isPhysicalDevice) {
          value = 'http://192.168.1.251';
        } else {
          value = 'http://localhost'; // ios emulator
        }
        return value;
      });
    }
  }
}
