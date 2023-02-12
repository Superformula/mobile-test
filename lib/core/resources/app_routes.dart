import 'package:flutter/material.dart';
import 'package:superformula_test/view/pages/home_page.dart';
import 'package:superformula_test/view/pages/qr_code_page.dart';
import 'package:superformula_test/view/pages/qr_code_scanner_page.dart';

class AppRoutesName {
  static const home = '/home';
  static const qrcode = '/qrcode';
  static const scan = '/scan';
}

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    AppRoutesName.home: (context) => const HomePage(),
    AppRoutesName.qrcode: (context) => const QrCodePage(),
    AppRoutesName.scan: (context) => const QRCodeScannerPage(),
  };
}
