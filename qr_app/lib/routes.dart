import 'package:flutter/material.dart';
import 'package:qr_app/home/home_screen.dart';
import 'package:qr_app/qr/qr_screen.dart';
import 'package:qr_app/scanner/scanner_screen.dart';

class Routes with RouteNames {

  // This method below will return the appropriate MaterialPageRoute depending on the
  // value in the setting.name.
  // This method will be called from the main MaterialApp onGenerateRoute

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    MaterialPageRoute route;
    // RouteSettings defaultRouteSettings = RouteSettings(name: settings.name);
    Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;

    switch (settings.name) {
      case RouteNames.Home:
        route = MaterialPageRoute(
          builder: (context) {
            return HomeScreen(
              title: args['title'],
            );
          },
          //settings: defaultRouteSettings,
        );
        break;
      case RouteNames.Scan:
        route = MaterialPageRoute(
          builder: (context) {
            return ScannerScreen(
              title: args['title'],
            );
          },
          // settings: defaultRouteSettings,
        );
        break;
      case RouteNames.Qr:
        route = MaterialPageRoute(
          builder: (context) {
            return QrScreen(
              title: args['title'],
            );
          },
          // settings: defaultRouteSettings,
        );
        break;
      default:
        route = MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
        break;

        break;
    }
    return route;
  }
}
//
// Below are the Route names that will be used for the Navigator.
// For example: Navigator.pushNamed(context, RouteNames.Home, arguments: {'arg1': 'value1'});
//
mixin RouteNames {
  static const String Root = '/';
  static const String Home = '/home';
  static const String Scan = '/scan';
  static const String Qr = '/qr';
}
