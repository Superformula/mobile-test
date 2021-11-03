import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mobile_test/ui/components/messages.dart';

import 'package:mobile_test/ui/components/standard_page.dart';
import 'package:mobile_test/api/seed_api.dart' as seed_api;

/// The Scanner class represents the Page for the QR Code barcode scanner. It
/// uses a StandardPage object.
class Scanner extends StatelessWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardPage(body: _ScannerPage(), title: 'Scan');
  }
}

/// The _ScannerPage widget contains a simple button to start scanning and if
/// a scan result exists, a _ScanResult Widget.
class _ScannerPage extends StatefulWidget {
  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<_ScannerPage> {
  String? scanResult;

  /// startScanStream is part of the FlutterBarcodeScanner package. When
  /// FlutterBarcodeScanner.scanBarcode is run, it places a fullScreen widget
  /// on top of the display and accesses the camera. If this is the first time
  /// a user attempts to scan, it prompts the user for permission to access the
  /// camera. When it finds a QR Code, it returns the value. If the user taps
  /// "Close" on the widget, the camera closes with the string '-1'.
  startScanStream() async {
    var result = await FlutterBarcodeScanner.scanBarcode(
        '#000000', 'Close', false, ScanMode.QR);

    String? _scanResult = result == '-1' ? null : result;

    setState(() {
      scanResult = _scanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      TextButton(
        onPressed: () {
          startScanStream();
        },
        child: const Text(
          'Scan Now',
        ),
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          primary: Colors.white,
          textStyle: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    ];

    // We get a locally scoped copy of scanResult so that we can check if it's
    // null. There's the possibility that the value may be null by an async op.
    var _scanResult = scanResult;

    if (_scanResult != null) {
      children.add(_ScanResult(_scanResult));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}

/// _ScanResult contains a FutureBuilder that makes a call to seed_api.validSeed
/// to determine if the seed provided by the QR Code is still valid. If it is
/// not valid, we display an error message. Otherwise, we display a success
/// message.
class _ScanResult extends StatelessWidget {
  final String scanResult;

  const _ScanResult(this.scanResult);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: seed_api.validateSeed(scanResult),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Text('Validating Code'),
            ],
          );
        }

        if (snapshot.hasError) {
          // show error message
          return const ErrorMessage('Invalid Seed');
        }

        return const Text(
          'Your QR Code is valid!',
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }
}
