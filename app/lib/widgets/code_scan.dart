import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class CodeScan extends StatelessWidget {
  final Function(String) scanCode;

  const CodeScan({Key key, this.scanCode}) : super(key: key);

  Future<void> _onPress() async {
    String value = await BarcodeScanner.scan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('Scan'),
          onPressed: _onPress,
        ),
      ),
    );
  }
}
