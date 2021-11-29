import 'package:flutter/cupertino.dart';
import 'package:qr_generator_app/feature/display_qr/display_qr_page.dart';
import 'package:qr_generator_app/feature/home/home_page.dart';
import 'package:qr_generator_app/feature/scan_qr/scan_qr_page.dart';

class AppRoutes {
  static const String home = "home";
  static const String displayQr = "displayQr";
  static const String scanQr = "scanQr";
}

final Map<String, WidgetBuilder> routes = {
  AppRoutes.home: (BuildContext context) => const HomePage(),
  AppRoutes.displayQr: (BuildContext context) => const DisplayQrPage(),
  AppRoutes.scanQr: (BuildContext context) => const ScanQrPage(),
};
