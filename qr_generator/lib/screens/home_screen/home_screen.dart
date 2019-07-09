import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qr_generator/models/seed.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var seed = Provider.of<Seed>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Something interesting here. Past scans?',
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        child: Icon(Icons.add),
        children: <SpeedDialChild>[
          SpeedDialChild(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/qrcode.png',
                color: Colors.white,
              ),
            ),
            label: 'QR Code',
            onTap: () => displayCode(context, seed),
          ),
          SpeedDialChild(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/scan.png',
                color: Colors.white,
              ),
            ),
            label: 'Scan',
            onTap: () => scanCode(context),
          ),
        ],
      ),
    );
  }

  scanCode(BuildContext context) {
    Navigator.pushNamed(context, '/scan');
  }

  displayCode(BuildContext context, Seed seed) {
    seed.fetchSeed();
    Navigator.pushNamed(context, '/display');
  }
}
