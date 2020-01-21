import 'package:flutter/material.dart';
import 'dart:async';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:sftest_flutter/models/qrdata.dart';
import 'package:sftest_flutter/services/networking.dart';


/// Screen to display QR Code given data from a seed API. 
class QRCodeScreen extends StatefulWidget {
  QRCodeScreen();

  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
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

/// Runs a periodic timer used to check expiration of QR data. 
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

  /// Downloads new seed data. 
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
            // TODO: Implement a loading animation and placeholder if QRData is empty. 
            QrImage(
              data: _qrData.seed,
              version: QrVersions.auto,
              size: 300.0,
              embeddedImage: AssetImage('assets/sf-mark-outline-white.png'),
              errorStateBuilder: (cxt, err) {
                return Container(
                  child: Center(
                    child: Text(
                      "Error loading QR Code",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
            // Text(
            //   "Current Time: ${DateTime.now().toUtc().toIso8601String()}",
            // ),
            // Text(
            //   "Expires: ${_qrData.expiresAt.toIso8601String()}",
            // ),
            Text(
              "Will reset in $_expiresInSeconds Seconds",
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}
