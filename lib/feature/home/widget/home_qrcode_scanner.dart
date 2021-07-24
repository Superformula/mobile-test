import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrtestcodeone/feature/home/bloc/home_bloc.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 21/07/21.
///

class HomeQrCodeScanner extends StatefulWidget {
  @override
  _HomeQrCodeScannerState createState() => _HomeQrCodeScannerState();
}

class _HomeQrCodeScannerState extends State<HomeQrCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return QRView(key: qrKey, onQRViewCreated: _onQRViewCreated);
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        context
            .read<HomeBloc>()
            .add(HomeEvent.handleScannedQrCode(scanData.code));
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
