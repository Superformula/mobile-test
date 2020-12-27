import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Dashboard extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Text(
            'Select an option from the bottom right to scan or generate a QR code.',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        children: [
          SpeedDialChild(
            label: 'QR Code',
            child: Icon(
              Icons.qr_code,
              color: Colors.white,
            ),
          ),
          SpeedDialChild(
            label: 'Scan',
            child: Icon(
              Icons.photo_camera,
              color: Colors.white,
            ),
          ),
        ],
        animatedIcon: AnimatedIcons.menu_close,
        animationSpeed: 80,
      ),
    );
  }
}
