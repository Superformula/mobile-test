import 'package:flutter/material.dart';
import 'package:qrcodevalidator/app/widgets/fancy_fab_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text('QR Code Validator'),
      ),
      floatingActionButton: FancyFabWidget(
        tooltip: 'Show buttons',
        actions: [
          FancyFabAction(
            onPressed: () {
              Navigator.of(context).pushNamed('/ScanQRCode');
            },
            label: 'Scan',
            icon: Icons.camera_alt,
          ),
          FancyFabAction(
            onPressed: () {
              Navigator.of(context).pushNamed('/DisplayQRCode');
            },
            label: 'QR Code',
            icon: Icons.qr_code,
          ),
        ],
      ),
    );
  }
}
