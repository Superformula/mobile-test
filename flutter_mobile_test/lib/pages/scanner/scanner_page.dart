import 'package:flutter/material.dart';
import 'package:flutter_mobile_test/barcode/barcode_wrapper.dart';
import 'package:flutter_mobile_test/pages/scanner/scanner_bloc.dart';

class ScannerPage extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<ScannerPage> {
  BarcodeBloc _bloc = BarcodeBloc(BarcodeWrapper());

  @override
  initState() {
    super.initState();
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
                    onPressed: _bloc.refresh,
                    child: Text("Scan again".toUpperCase())),
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: StreamBuilder(
                      stream: _bloc.scannerObservable,
                      builder: (context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData && snapshot.data != null) {
                          return Text(snapshot.data,
                              textAlign: TextAlign.center);
                        } else {
                          return Text("Error reading Code");
                        }
                      })),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
