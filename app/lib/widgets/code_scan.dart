import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class CodeScan extends StatefulWidget {
  final bool validating;
  final bool codeIsValid;
  final Function(String) validateCode;

  CodeScan({
    Key key,
    this.validateCode,
    this.validating,
    this.codeIsValid,
  }) : super(key: key);

  @override
  _CodeScanState createState() => _CodeScanState();
}

class _CodeScanState extends State<CodeScan> {
  @override
  void initState() {
    super.initState();
    _scan();
  }

  Future<void> _scan() async {
    String code = await BarcodeScanner.scan();

    if (code != null) {
      widget.validateCode(code);
    }
  }

  Widget _buildImageIsValid() {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Icon(
        widget.codeIsValid ? Icons.check : Icons.close,
        size: 90,
        color: widget.codeIsValid ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan'),
      ),
      body: Center(
        child: widget.validating
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (widget.codeIsValid != null) _buildImageIsValid(),
                  RaisedButton(
                    child: Text('SCAN AGAIN'),
                    onPressed: _scan,
                  )
                ],
              ),
      ),
    );
  }
}
