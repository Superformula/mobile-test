import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // this reassemble block is required for hot reload to work
  // if the platform is Android we pause the camera and if the platform is iOS we resume
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    // dispose our camera (QRView) controller to avoid any sort of memory leaks
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // QrCodeScanner with some overlay styling
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              cutOutSize: deviceSize.width * 0.75,
              borderColor: Theme.of(context).primaryColor,
              borderRadius: 15,
              borderWidth: 8,
            ),
          ),
          // Place text below the QrView overlay to display the code result
          Positioned(
            bottom: 60,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white70,
              ),
              padding: const EdgeInsets.all(
                15,
              ),
              child: (result != null)
                  ? Text('Data: ${result!.code}')
                  : const Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}
