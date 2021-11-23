import 'package:flutter/material.dart';
import 'package:qr_generator/screens/qr_screen/qr_screen.dart';
import 'package:qr_generator/screens/scan_screen/scan_screen.dart';

class Routes {
  Routes._();

  static const String qrScreen = '/qr_screen';
  static const String scanScreen = '/scan_screen';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      qrScreen: (context) => QrScreen(),
      scanScreen: (context) => ScanScreen(),
    };
  }
}
