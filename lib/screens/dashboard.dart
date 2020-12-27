import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:superformula_challenge/screens/screens.dart';

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
            onTap: () => Navigator.pushNamed(context, QrView.route),
          ),
          SpeedDialChild(
            label: 'Scan',
            child: Icon(
              Icons.photo_camera,
              color: Colors.white,
            ),
            onTap: () async {
              var result = await BarcodeScanner.scan();
              if (result != null) {
                // Show a dialog with the QR code scan result
                showDialog(
                  context: context,
                  child: AlertDialog(
                    title: Text(
                      'Secret Word',
                    ),
                    content: Text(
                      result.rawContent,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Ok'),
                      )
                    ],
                  ),
                );
              }
              //Navigator.pushNamed(context, ScanView.route);
            },
          ),
        ],
        animatedIcon: AnimatedIcons.menu_close,
        animationSpeed: 80,
      ),
    );
  }
}
