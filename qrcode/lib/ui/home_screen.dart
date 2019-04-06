
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode/main.dart';

///
/// Initial app screen, used to jump to QRCode and Scan screens
///
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    _handleScanPressed() => Navigator.pushNamed(context, QRCodeApp.NAV_SCAN_SCREEN);

    _handleQRCodePressed() => Navigator.pushNamed(context, QRCodeApp.NAV_QRCODE_SCREEN);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          OutlineButton(
            onPressed: _handleScanPressed,
            child: Text("Scan"),
          ),
          OutlineButton(
            onPressed: _handleQRCodePressed,
            child: Text("QR Code"),
          ),
        ],
      ),
    );
  }
}
