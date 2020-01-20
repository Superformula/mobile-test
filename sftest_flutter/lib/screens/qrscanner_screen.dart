import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:barcode_scan/barcode_scan.dart';

class QRScannerScreen extends StatefulWidget {
  QRScannerScreen();

  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _result = "Tap the Scan Button";
  /// Initiate QR Scanner.
  Future _scanQR() async {
    print("Scanning QR...");
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        _result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          _result = "Camera permission was denied";
        });
      } else {
        setState(() {
          _result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        _result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        _result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _result,
              style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            Text(
              "Current Time: ${DateTime.now().toUtc().toIso8601String()}",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
