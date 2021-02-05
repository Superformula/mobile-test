import 'package:flutter/material.dart';
import 'package:qrGenerator/app/pages/home_page.dart';
import 'package:qrGenerator/app/pages/qr_code_page.dart';
import 'package:qrGenerator/app/pages/scan_page.dart';

import 'routes.dart';

/// Navigation router for the app. Invokes the proper target page per request; includes mechanisms
/// for animation transitions and data passing (via settings) between pages, if necessary.
class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.qrCode:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) => QRCodePage()
        );
      case Routes.scan:
      return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => ScanPage()
      );
      case Routes.home:
      default:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => HomePage()
        );
    }
  }
}