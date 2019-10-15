import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_test/pages/scanner/scanner_bloc.dart';

class ScannerPage extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<ScannerPage> {
  String code = "";
  BarcodeBloc _bloc = BarcodeBloc();
  StreamSubscription codeSubscription;

  @override
  initState() {
    super.initState();

    _scan();

    codeSubscription = _bloc.scannerObservable.listen((reading) {
      print('BarcodeReading: $reading');
      setState(() {
        code = reading;
      });
    }, onError: (error) {
      print('BarcodeReading error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Scan'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
//                    onPressed: _scan,
                    child: Text("Scan again".toUpperCase())),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  code,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _bloc.dispose();
    codeSubscription.cancel();
    super.dispose();
  }

  Future _scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      _bloc.scannerSink.add(barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        print('The user did not grant the camera permission!');
      } else {
        print('Unknown error: $e');
      }
    } on FormatException {
      print(
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      print('Unknown error: $e');
    }
  }
}
