import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qr_code/qr_code/qr_code_page.dart';
import 'package:qr_code/scan/scan_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        overlayColor: Colors.black,
        overlayOpacity: 0.3,
        children: [
          SpeedDialChild(
            labelWidget: Text('QR Code'),
            child: Icon(Icons.qr_code),
            onTap: () {
              print('Button tapped');
              _navigateToQrCodePage(context);
            },
          ),
          SpeedDialChild(
            labelWidget: Text('Scan'),
            child: Icon(Icons.fit_screen),
            onTap: () => _navigateToScanPage(context),
          ),
        ],
      ),
    );
  }

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
