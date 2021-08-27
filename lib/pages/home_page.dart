import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                'You have pushed the button this many times as well:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
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
                label: 'QR Code'),
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
