import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qr_gen/ui/screens/generator.dart';

import 'scanner.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({@required this.title});

  _handleScan(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ScannerScreen()));
  }

  _handleGenerate(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GeneratorScreen()));
  }

  _buildSpeedDial(context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      children: [
        SpeedDialChild(
          child: Icon(Icons.details, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () => _handleGenerate(context),
          label: 'QR Code',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.greenAccent,
        ),
        SpeedDialChild(
          child: Icon(Icons.camera, color: Colors.white),
          backgroundColor: Colors.deepOrange,
          onTap: () => _handleScan(context),
          label: "Scan",
          labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.red),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Welcome to QrGen',
                style: textTheme.headline,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'QrGen allows you to quickly identify your new friend using their QR Code.',
                style: textTheme.subhead,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildSpeedDial(context),
    );
  }
}
