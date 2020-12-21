import 'package:flutter/material.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';
import 'package:mobile_test/src/screens/base_screen.dart';
import 'package:mobile_test/src/screens/qr_code_generator.dart';
import 'package:mobile_test/src/screens/qr_scanner.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void pushNextScreen(Widget nextScreen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _fabMiniMenuItemList = [
      FabMiniMenuItem.withText(
          Icon(Icons.qr_code_scanner),
          Colors.blue,
          4.0,
          "Button menu",
          () => pushNextScreen(QRCodeScannerScreen()), //Scanner
          "Scan",
          Colors.blue,
          Colors.white,
          true),
      FabMiniMenuItem.withText(
          Icon(Icons.qr_code),
          Colors.blue,
          4.0,
          "Button menu",
          () => pushNextScreen(GenerateQRCodeScreen()), //Scanner
          "QRCode",
          Colors.blue,
          Colors.white,
          true),
    ];

    return BaseScreenScaffold(
      title: 'HOME',
      body: Container(
        child: FabDialer(_fabMiniMenuItemList, Colors.blue, Icon(Icons.add)),
      ),
    );
  }
}
