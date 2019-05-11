import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeScan extends StatefulWidget {
  static const String defaultErrorMessage =
      'Failed to validate QR Code. Please try again.';
  final bool validating;
  final bool codeIsValid;
  final Function(String, {Function() onError}) validateCode;

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
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _scan();
  }

  Future<void> _scan() async {
    try {
      String code = await BarcodeScanner.scan();
      if (code != null) {
        widget.validateCode(
          code,
          onError: _showErrorSnackBar,
        );
      }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        _showErrorSnackBar('Please give access to the camera to scan codes.');
      } else {
        _showErrorSnackBar();
      }
    } catch (e) {}
  }

  void _showErrorSnackBar([String errorText = CodeScan.defaultErrorMessage]) {
    _scaffoldKey?.currentState?.showSnackBar(
      SnackBar(
        content: Text(errorText),
      ),
    );
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
      key: _scaffoldKey,
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
