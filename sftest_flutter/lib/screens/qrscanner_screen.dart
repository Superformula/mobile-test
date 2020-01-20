import 'package:flutter/material.dart';
import 'dart:async';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:sftest_flutter/models/qrdata.dart';
import 'package:sftest_flutter/services/networking.dart';

class QRScannerScreen extends StatefulWidget {
  QRScannerScreen();

  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  // Hard-coding some initial data just for the test project.   
  static String dateString = DateTime.now().add(Duration(minutes: 1)).toIso8601String();
  static var initialQRData = {
    'seed': 'http://superformula.com',
    'expiresAt': dateString
  };
  QRData _qrData = QRData.fromJson(initialQRData);
  int _expiresInSeconds = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
    getQRData();
  }

@override
void dispose() {
  _timer.cancel();
  super.dispose();
}

// Runs a periodic timer used to check expiration of QR data. 
Timer _timer;

void startTimer() {
  const oneSec = const Duration(seconds: 1);
  _timer = new Timer.periodic(
    oneSec,
    (Timer timer) => setState(
      () {
        DateTime _nowTime = DateTime.now();
        Duration _timeDiff = _nowTime.difference(_qrData.expiresAt);
        _expiresInSeconds = -(_timeDiff.inSeconds);

        if (_qrData.expiresAt.isBefore(_nowTime)) {
          getQRData();
        } 
      },
    ),
  );
}

  void getQRData() async {
    print("In getQRData");
    // URL is hardcoded for the test project. Would not be in production code.
    NetworkHelper networkHelper =
        NetworkHelper('http://ahchto.cbgrey.com:8888/seed');

    var qrNetworkData;

    try {
      qrNetworkData = await networkHelper.getQRData();
    } catch (e) {
      print(e);
      return;
    }

    _qrData = QRData.fromJson(qrNetworkData);

    setState(() {
      print('Setting state for QR Screen. QR Seed: ${_qrData.seed}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("This is the scanner screen."),
            Text(
              "Current Time: ${DateTime.now().toUtc().toIso8601String()}",
            ),
          ],
        ),
      ),
    );
  }
}
