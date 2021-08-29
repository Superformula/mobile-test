import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:superformula_test/pages/home_page.dart';
import 'package:superformula_test/pages/qr_page.dart';
import 'package:superformula_test/pages/qr_scanner.dart';

class AppRoutes {
  static final router = FluroRouter();

  static Future<dynamic> navigate(BuildContext context, String routeName,
      {dynamic args}) {
    return router.navigateTo(context, routeName,
        routeSettings: RouteSettings(
          arguments: args,
        ));
  }

  static void createRoutes() {
    router.define('home', handler: Handler(handlerFunc: (context, params) {
      dynamic args = context!.settings!.arguments;
      return MyHomePage(title: args);
    }));
    router.define('/qrcode', handler: Handler(handlerFunc: (context, params) {
      dynamic args = context!.settings!.arguments;
      return QrCodePage(title: args);
    }));
    router.define('/qrscanner',
        handler: Handler(handlerFunc: (context, params) {
      dynamic args = context!.settings!.arguments;
      return QrScannerPage(title: args);
    }));
    router.notFoundHandler = Handler(handlerFunc: (context, params) {
      return null;
    });
  }
}
