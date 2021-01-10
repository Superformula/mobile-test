import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerCamera extends StatefulWidget {
  @override
  _ScannerCameraState createState() => _ScannerCameraState();
}

class _ScannerCameraState extends State<ScannerCamera> {
 
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey();

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 5, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                margin: EdgeInsets.all(8),
                child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 result != null ? 
                    Container(child: CircleAvatar(child: Icon(Icons.check),)) 
                    // Text(
                    //     'Barcode Type: ${result.format.toString()}   Data: ${result.code}'))
                  :
                  Container(
                    
                    child: 
                    Text('Scan a code',)),
                
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
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 5,
        //cutOutSize: scanArea,
      ),
    );
    
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        HapticFeedback.vibrate();
        controller?.pauseCamera();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}