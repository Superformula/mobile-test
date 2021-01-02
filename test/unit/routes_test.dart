import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_test/configs/routes.dart';

void main() {
  group("Making sure that route names are consistent", () {
    test("Verifying route names", () {
      expect(RouteGenerator.homePage, "/");
      expect(RouteGenerator.fetchQR, "/fetch_qr");
      expect(RouteGenerator.scanQR, "/scan_qr");
      expect(RouteGenerator.validateQR, "/validate_qr");
    });

    test("Checking routes health", () {
      // Determines the status of the test
      var success = true;

      // The list of routes to be tested
      final routes = <String>[
        RouteGenerator.homePage,
        RouteGenerator.fetchQR,
        RouteGenerator.scanQR,
        RouteGenerator.validateQR,
      ];

      try {
        // Making sure no exceptions are thrown inside routes
        for (var route in routes) {
          final setting = RouteSettings(name: route);
          RouteGenerator.generateRoute(setting);
        }
      } on Exception {
        success = false;
      }

      expect(success, true);
    });

    test("Checking the type of the exception thrown", () {
      expect(() {
        RouteGenerator.generateRoute(RouteSettings(name: ""));
      }, throwsA(isA<RouteException>()));
    });
  });
}