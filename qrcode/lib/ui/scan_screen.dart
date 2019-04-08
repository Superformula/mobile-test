import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:async';

///
/// Screen used to scan QRCodes
///
class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

///
/// Utilize code from barcode scan library example
/// https://github.com/apptreesoftware/flutter_barcode_reader/blob/master/example/lib/main.dart
///
class _ScanScreenState extends State<ScanScreen> {
  String barcode = "";

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan"),),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new OutlineButton(
                  onPressed: scan, child: new Text("Open Scanner")),
                padding: const EdgeInsets.all(8.0),
            ),
            new Text(barcode),
          ],
        ),
    ));
  }
}