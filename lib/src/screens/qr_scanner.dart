import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_test/src/bloc/qr_code_generator_bloc.dart';
import 'package:mobile_test/src/screens/base_screen.dart';
import 'package:mobile_test/src/styles/custom_styles.dart';
import 'package:mobile_test/src/utilities/size_config.dart';

class QRCodeScannerScreen extends StatefulWidget {
  @override
  QRCodeScannerScreenState createState() => QRCodeScannerScreenState();
}

class QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  String result = '';

  @override
  void initState() {
    super.initState();
    scanQRCode();
  }

  Future<void> scanQRCode() async {
    try {
      final String cameraResult = await BarcodeScanner.scan();
      setState(() {
        if (cameraResult != null) {
          if (qrCodeBloc.validateQrCodeStatus(cameraResult)) {
            result = 'Qr code scanned:\n' + cameraResult;
          } else {
            result = 'Qr code is not valid or expired, try again!';
          }
        } else {
          setState(() => result = 'cameraResult is null');
        }
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = 'No camera permission granted try again!';
        });
      } else {
        setState(() => result = 'Unexpected error:');
      }
    } on FormatException {
      setState(() => result = 'Sorry, nothing captured. Try again');
    } catch (e) {
      setState(() => result = 'Unexpected error:');
    }

    if (!mounted) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenScaffold(
        title: 'SCAN',
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      margin: EdgeInsets.only(
                          left: getBlockSizeHorizontal(context) * 5,
                          right: getBlockSizeHorizontal(context) * 5,
                          bottom: getBlockSizeHorizontal(context) * 5),
                      child: Text(
                        result,
                        style: CustomStyles.defaultStyle.copyWith(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ))),
              result != ''
                  ? FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.blueAccent,
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: getBlockSizeHorizontal(context) * 4,
                              bottom: getBlockSizeHorizontal(context) * 4,
                              left: getBlockSizeHorizontal(context) * 4,
                              right: getBlockSizeHorizontal(context) * 4),
                          child: const Text('Try another QR code',
                              style: CustomStyles.defaultStyle)),
                      onPressed: () {
                        scanQRCode();
                      },
                    )
                  : Container(
                      color: Colors.transparent,
                    ),
            ]));
  }
}
