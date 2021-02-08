import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController _controller;

  void _onViewCreated(QRViewController controller) {
    _controller = controller;

    _controller.scannedDataStream.listen((scanData) {
      _controller.pauseCamera();
      _showDialog(scanData.code);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showDialog(String value) {
    showDialog(
        context: context,
        builder: (_) {
          return SimpleDialog(
            title: const Text('Scan Results'),
            children: [
              SimpleDialogOption(
                child: Text(value),
              ),
              SimpleDialogOption(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        _controller.resumeCamera();
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 50),
          child: QRView(
            key: _qrKey,
            onQRViewCreated: _onViewCreated,
          ),
        ),
      ),
    );
  }
}
