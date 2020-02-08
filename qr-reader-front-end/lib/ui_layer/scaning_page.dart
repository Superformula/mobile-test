import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:superformula/ui_layer/animated_reticle.dart';

class ScanningPage extends StatefulWidget {
  static const route = '/scanning';

  @override
  _ScanningPageState createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  final cameraSize = 300.0;

  QRViewController controller;

  String qrCodeText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildScanner(),
          if (qrCodeText != null) ...[
            SizedBox(
              height: 8,
            ),
            Text('Last QR Code Value:'),
            Text(
              qrCodeText,
              style: Theme.of(context).textTheme.subhead,
            )
          ]
        ],
      ),
    );
  }

  Widget _buildScanner() {
    return Stack(
      children: <Widget>[
        _buildCameraPreview(),
        AnimatedReticle(
          size: cameraSize,
          colour: qrCodeText == null ? Colors.purple : Colors.green,
        ),
      ],
    );
  }

  Widget _buildCameraPreview() {
    //NOTE: This function will throw an exception on the simulator/emulator
    //You need to run the app in a real device to see the camera
    return Center(
      child: SizedBox(
        width: cameraSize,
        height: cameraSize,
        child: QRView(
          onQRViewCreated: onQRCodeRead,
          key: qrKey,
        ),
      ),
    );
  }

  void onQRCodeRead(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((data) {
      setState(() {
        qrCodeText = data;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
