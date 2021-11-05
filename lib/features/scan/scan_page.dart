import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sf_qr_code/themes/app_colors.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String _scanBarcode = '';
  late Size dSize;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenishDark,
        centerTitle: true,
        title: Text("SCAN", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Wrap(
                children: [
                  Text(
                    _scanBarcode,
                    style: TextStyle(color: Colors.blue, fontSize: 40),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * .75,
                    child: ElevatedButton(
                        child: Text("Tap to scan",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        style: ButtonStyles.getDesign(),
                        onPressed: () {
                          scanQRCode();
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scanQRCode() async {
    String scannedResult;
    try {
      scannedResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      scannedResult = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      // setting the value to the state
      _scanBarcode = scannedResult == "-1" ? "" : scannedResult;
    });
  }
}
