import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qr_generator/router/router.gr.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      floatingActionButton: SpeedDial(
        overlayOpacity: 0,
        spacing: 8,
        child: Icon(Icons.add),
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.qr_code_rounded,
              color: Theme.of(context).colorScheme.secondary,
            ),
            label: 'QR Code',
            onTap: () {
              context.pushRoute(QRGeneratorRoute());
            },
          ),
          SpeedDialChild(
              child: Icon(
                Icons.qr_code_scanner_rounded,
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: 'Scan QR',
              onTap: () {
                context.pushRoute(QRScannerRoute());
              }),
        ],
      ),
    );
  }
}
