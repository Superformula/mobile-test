import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:superformula_test/router/router.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title = 'Home'}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            widget.title,
            style: TextStyle(color: Colors.green[700]),
          )),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'SUPERFORMULA TEST',
              ),
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
          overlayOpacity: 0,
          backgroundColor: Colors.black,
          activeChild: Icon(
            Icons.close,
            color: Colors.green[700],
          ),
          child: Icon(
            Icons.add,
            color: Colors.green[700],
          ),
          children: [
            SpeedDialChild(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.qr_code,
                  color: Colors.green[700],
                ),
                label: 'QR Code',
                onTap: () {
                  AppRoutes.navigate(context, '/qrcode', args: 'QR Code');
                }),
            SpeedDialChild(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.qr_code_scanner,
                  color: Colors.green[700],
                ),
                label: 'QR Scanner')
          ],
        )
        // FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: Icon(Icons.add),
        // ),
        );
  }
}
