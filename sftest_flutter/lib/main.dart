import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:sftest_flutter/screens/qrcode_screen.dart';
import 'package:sftest_flutter/screens/qrscanner_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /// Navigate to the QR Display screen. 
  void _goToQRScreen() {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) {
          return new QRCodeScreen();
        },
      ),
    );
  }

  /// Navigate to the QR Scanner screen. 
  void _goToScannerScreen() {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) {
          return new QRScannerScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Select a function from the menu.",
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
          marginRight: 18,
          marginBottom: 20,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Icon(Icons.language),
              backgroundColor: Colors.green,
              label: 'QRCode',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => _goToQRScreen()
            ),
            SpeedDialChild(
              child: Icon(Icons.camera),
              backgroundColor: Colors.blue,
              label: 'Scan',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => _goToScannerScreen(),
            ),
          ],
        ),
    );
  }
}
