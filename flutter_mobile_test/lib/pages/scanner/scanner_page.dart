import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/pages/scanner/scanner_bloc.dart';

class ScannerPage extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<ScannerPage> {
  BarcodeBloc _bloc = locator();
  StreamSubscription _validationSubscription;

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
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
                    onPressed: _bloc.validate,
                    child: Text("Validate".toUpperCase())),
              ),
              StreamBuilder(
                  stream: _bloc.validateCodeObservable,
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                          snapshot.data
                              ? 'This code is  valid'
                              : 'This code is not valid',
                          textAlign: TextAlign.center);
                    } else if(snapshot.hasError) {
                      return Text("Error validating Code");
                    } else {
                      return Container();
                    }
                  }),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _validationSubscription.cancel();
    super.dispose();
  }
}
