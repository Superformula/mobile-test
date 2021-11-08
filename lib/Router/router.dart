import 'package:flutter/material.dart';
import 'package:generator/generate_code/generate.dart';
import 'package:generator/scan_code/scan.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/GeneratePage':
        return MaterialPageRoute(builder: (_) => GeneratePage());
      case '/ScanPage':
        return MaterialPageRoute(builder: (_) => ScanPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}