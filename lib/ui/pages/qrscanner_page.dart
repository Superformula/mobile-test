import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrapp/services/qrservice.dart';
import 'package:qrapp/ui/components/qrstatuswidget.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({Key? key}) : super(key: key);

  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrScannerKey = GlobalKey(debugLabel: 'QR Scanner');
  late QRService provider;
  Barcode? qrResults;
  QRViewController? qrController;

  bool scanningComplete = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      provider = Provider.of<QRService>(context, listen: false);
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    } else if (Platform.isIOS) {
      qrController!.resumeCamera();
    }
  }

  void _onScannerStart(QRViewController controller) async {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrResults = scanData;
        provider.verifySeed(context, scanData.code!);
      });
    });
  }

  @override
  void dispose() {
    if (qrController != null) {
      qrController!.dispose();
    }
    super.dispose();
  }

  Widget buildScanningWindow(BuildContext context) {
    if (context.watch<QRService>().isQRScanning == true) {
      return Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Stack(
              fit: StackFit.expand,
              children: [
                QRView(
                  key: qrScannerKey,
                  onQRViewCreated: _onScannerStart,
                ),
                Lottie.asset('assets/lottie/16589-qrcode-scanner.json',
                    repeat: true),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Scan a QR Code!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      );
    }

    if (context.watch<QRService>().isQRScanning == false) {
      return Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
              child: QRStatusWidget(
                status: context.watch<QRService>().seedStatus,
                seed: context.watch<QRService>().seed,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: OutlinedButton(
                onPressed: () {
                  scanningComplete = false;
                  provider.retryScan();
                },
                child: const Text("Scan Again"),
              ),
            ),
          ),
        ],
      );
    }

    return const Text("Error");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner"),
      ),
      body: buildScanningWindow(context),
    );
  }
}
