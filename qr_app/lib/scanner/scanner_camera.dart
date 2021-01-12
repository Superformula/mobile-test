import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_app/scanner/scanner_result.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerCamera extends StatefulWidget {
  @override
  _ScannerCameraState createState() => _ScannerCameraState();
}

class _ScannerCameraState extends State<ScannerCamera> {
  Barcode _result;
  QRViewController _controller;
  final GlobalKey _qrKey = GlobalKey();

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller.pauseCamera();
    } else if (Platform.isIOS) {
      _controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 3, child: _buildQrView(context)),
          Expanded(
            //  flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _result != null
                          ? ScannerResult(
                              scanResult: _result.code,
                            )
                          : Container(
                              child: Text(
                              'Scan a code',
                            )),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: _qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 5,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this._controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        HapticFeedback.vibrate();
        controller?.pauseCamera();
        controller?.dispose();
        _result = scanData;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
