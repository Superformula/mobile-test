import 'dart:io';
import 'package:device_info/device_info.dart';

class BaseService {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo;
  IosDeviceInfo iosInfo;
  Future<String> getHost()  {
    String value = '';
    // Android
    if (Platform.isAndroid) {
      return deviceInfo.androidInfo.then((androidInfo) {
      if (androidInfo.isPhysicalDevice) {
        value = 'http://192.168.1.251'; // This is my local ip
      } else {
        value = 'http://10.0.2.2'; // android emulator
      }
      return value;
      });
    } // IOS
    else {
      return deviceInfo.iosInfo.then((iosInfo) {
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
