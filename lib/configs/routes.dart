import 'package:flutter/material.dart';
import 'package:qr_code_test/routes/home_page.dart';
import 'package:qr_code_test/routes/qr_fetch_page.dart';
import 'package:qr_code_test/routes/qr_scan_page.dart';
import 'package:qr_code_test/routes/qr_validation_page.dart';

/// Route management class that handles the navigation among various pages of the
/// app. New routes should be opened in the following ways:
///
/// ```dart
/// // Stragegy 1.
/// Navigator.of(context).pushNamed(RouteGenerator.homePage);
///
/// // Strategy 2.
/// Navigator.pushNamed(context, RouteGenerator.homePage);
/// ```
///
/// No differences since both ways are valid.
abstract class RouteGenerator {

  /// Method to be used in a `MaterialApp` or `CupertinoApp` to declare the
  /// routes of the app.
  ///
  /// ```dart
  /// MaterialApp(
  ///   onGenerateRoute: RouteGenerator.generateRoute,
  ///   initialRoute: RouteGenerator.homePage,
  /// )
  /// ```
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      case scanQR:
        return MaterialPageRoute(
          builder: (_) => const QRScanRoute(),
        );

      case fetchQR:
        return MaterialPageRoute(
          builder: (_) => const QRFetchRoute(),
        );

      case validateQR:
        return MaterialPageRoute(
          builder: (_) => const QRValidationRoute(),
        );

      default:
        throw const RouteException("Route not found");
    }
  }

  /// Named route for the home page
  static const homePage = "/";

  /// Named route for the QR scanning page
  static const scanQR = "/scan_qr";

  /// Named route for the QR fetching page
  static const fetchQR = "/fetch_qr";

  /// Named route for the QR validation page
  static const validateQR = "/validate_qr";
}

/// Exception to be thrown when the route being pushed doesn't exist
class RouteException implements Exception {
  /// The error message
  final String message;
  /// Requires an error [message] to be associated to the exception object.
  const RouteException(this.message);
}