import 'package:flutter/material.dart';
import 'package:super_qr/utils/constants.dart';

/// Page that will allow the user to scan a QR code.
class ScanQRView extends StatefulWidget {
  @override
  _ScanQRViewState createState() => _ScanQRViewState();
}

class _ScanQRViewState extends State<ScanQRView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SCAN_A_QR_CODE_PAGE_TITLE,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [Text('TODO: Scan a QR Code!')],
        ),
      ),
    );
  }
}
