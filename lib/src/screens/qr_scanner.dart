import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_test/src/bloc/qr_code_generator_bloc.dart';
import 'package:mobile_test/src/screens/base_screen.dart';

class QRCodeScannerScreen extends StatefulWidget {
  @override
  QRCodeScannerScreenState createState() => QRCodeScannerScreenState();
}

class QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  String result = 'UNKNOWN';

  @override
  void initState() {
    super.initState();
    _scanQR();
  }

  Future<void> _scanQR() async {
    try {
      String cameraResult = await BarcodeScanner.scan();
      setState(() {
        if (qrCodeBloc.checkQrCodeIsValid(cameraResult)) {
          this.result = 'Qr code is valid';
        } else {
          this.result = 'Qr code is not valid or expired';
        }
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.result = 'No camera permission!';
        });
      } else {
        setState(() => this.result = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.result = 'Nothing captured.');
    } catch (e) {
      setState(() => this.result = 'Unknown error: $e');
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenScaffold(
        title: 'SCAN',
        body: Container(
            alignment: Alignment.center,
            child: Column(children: [
              Text(
                result,
                style:
                    new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              )
            ])));
  }
}
