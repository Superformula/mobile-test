import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_gen/core/models/seed.dart';
import 'package:qr_gen/core/services/scan.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String _error;
  String _qrCode;
  final ScanService _scanService = GetIt.instance<ScanService>();

  @override
  initState() {
    super.initState();

    _scan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan')),
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ..._buildMessage(context),
              SizedBox(
                height: 25,
              ),
              FlatButton(
                child: Text(
                    _qrCode != null || _error != null ? 'Scan again' : 'Scan'),
                onPressed: () => _scan(),
              )
            ],
          )),
    );
  }

  _buildMessage(context) {
    final textTheme = Theme.of(context).textTheme;

    if (_error != null)
      return [
        Text(
          'Issue with scan',
          style: textTheme.headline,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(_error, style: textTheme.body1.copyWith(color: Colors.red)),
      ];
    if (_qrCode != null) {
      final seed = Seed.fromJson(jsonDecode(_qrCode));

      return [
        Text(
          'Scanned successfully',
          style: textTheme.headline,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text('Seed: ${seed.seed}'),
        Text('Expiry: ${seed.expiresAt}'),
      ];
    }

    return [];
  }

  _scan() async {
    try {
      final qrCode = await _scanService.scan();

      setState(() {
        _qrCode = qrCode;
        _error = null;
      });

      return qrCode;
    } on ScanServiceError catch (e) {
      setState(() {
        _qrCode = null;
        _error = errors[e.code] ?? 'Unknown error: ${e.message ?? ""}';
      });
    } catch (e) {
      _qrCode = null;
      setState(() => _error = 'Unknown error: ${e.message ?? ""}');
    }
  }
}

const errors = {
  ScanServiceErrorCode.CameraAccessDenied:
      'You did not grant the camera permission!',
  ScanServiceErrorCode.Format: 'You cancelled the scan!'
};
