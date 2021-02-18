import 'package:flutter/material.dart';
import 'package:qr_code/scan/camera_permission_widget.dart';
import 'package:qr_code/scan/qr_scanner.dart';
import 'package:qr_code/validation/validation_dialog.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool _showScanner = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan'),
      ),
      body:
          CameraPermissionWidget(child: _showScanner ? QrScanner(onScanCallback: (code) => _showQrCodeValidationDialog(context, code)) : Container()),
    );
  }

  Future _showQrCodeValidationDialog(BuildContext context, String codeToValidate) async {
    // We disable the scanner to avoid showing the ValidationDialog multiple times, and to preserve battery
    _disableScanner();

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ValidationDialog(codeToValidate),
        fullscreenDialog: true,
      ),
    );

    _enableScanner();
  }

  void _disableScanner() {
    setState(() {
      _showScanner = false;
    });
  }

  void _enableScanner() {
    setState(() {
      _showScanner = true;
    });
  }
}
