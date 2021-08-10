import 'package:flutter/material.dart';
import 'package:qrdemo/screens/history_screen.dart';
import 'package:qrdemo/screens/qr_screen.dart';
import 'package:qrdemo/screens/scanner_screen.dart';
import 'package:qrdemo/screens/home_screen.dart' as home;

class RoutingProvider extends ChangeNotifier {
  RoutingProvider();

  Future<void> goToScannerScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScannerScreen()),
    );
  }

  Future<void> goToQRScreen(BuildContext context) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => QRScreen()));
  }

  Future<void> goToHomeScreen(BuildContext context) async {
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => home.HomeScreen()),
        (route) => false);
  }

  Future<void> goToHistoryScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryScreen()),
    );
  }
}
