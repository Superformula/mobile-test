import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrGenerator/app/resources/qr_styles.dart';
import 'package:qrGenerator/app/view_models/qrcode_view_model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey _qrKey = GlobalKey();
  Barcode _scanResult;
  QRViewController _qrViewController;

  // For hot reload, pause camera if the platform is android, or resume the
  // camera is the platform is iOS (as per the QRCodeScanner documentation)
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _qrViewController.pauseCamera();
    } else if (Platform.isIOS) {
      _qrViewController.resumeCamera();
    }
  }

  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QrCodeViewModel>(
      create: (context) => QrCodeViewModel(),
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text('Scan', style: TextStyle(color: Colors.black45))),
          body: Column(
            children: [
              Expanded(
                child: QRView(
                  key: _qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
                flex: 5,
              ),
              Consumer<QrCodeViewModel>(builder: (context, model, child) {
                return Expanded(
                  child: Center(child: _displayScannedResult(model)),
                  flex: 1,
                );
              }),
            ],
          ))
    );
  }

  // Obtain scanned result
  void _onQRViewCreated(QRViewController controller) {
    _qrViewController = controller;
    _qrViewController.scannedDataStream.listen((scanResult) {
      setState(() {
        _scanResult = scanResult;
      });
    });
  }

  // Display scanned result
  _displayScannedResult(QrCodeViewModel model) {
    if (_scanResult != null) {
      // Expired QR Images will have the 'expired' text embedded as the qr code:
      var seedHasExpired = _scanResult.code == 'expired';
        return seedHasExpired? Text('Seed has expired', style: QrStyles.errorDisplay) :
        Text('Seed: ${_scanResult.code}', style: QrStyles.dataDisplay);
      }
    return Text('Scan a code');
  }
}
