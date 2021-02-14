import 'package:flutter/material.dart';
import 'package:qr_code/qr_code/qr_code_page.dart';
import 'package:qr_code/scan/scan_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('QR Code'),
              onPressed: () => _navigateToQrCodePage(context),
            ),
            RaisedButton(
              child: Text('Scan'),
              onPressed: () => _navigateToScanPage(context),
            ),
          ],
        ),
      );

  void _navigateToQrCodePage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => QrCodePage(),
    ));
  }

  void _navigateToScanPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ScanPage(),
    ));
  }
}
