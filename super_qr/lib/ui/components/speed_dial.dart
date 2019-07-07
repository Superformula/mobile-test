// Let's utilize https://github.com/tiagojencmartins/unicornspeeddial to save
// time customly implementing something we don't need to. If we were to
// roll a custom solution (needing something the library doesn't provide)
// I'd use an array of buttons to populate above the main button we always show,
// rendering those buttons above onPress.

import 'package:flutter/material.dart';
import 'package:super_qr/ui/qr_display.dart';
import 'package:super_qr/ui/qr_scan.dart';
import 'package:super_qr/utils/colors.dart';
import 'package:unicorndial/unicorndial.dart';

class HomeSpeedDial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of child buttons here for access to context
    final childButtons = [
      UnicornButton(
          hasLabel: true,
          labelText: "Scan QR Code",
          currentButton: FloatingActionButton(
            heroTag: "Scan QR Code",
            mini: true,
            child: Icon(Icons.camera_alt),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ScanQRView()));
            },
          )),
      UnicornButton(
          hasLabel: true,
          labelText: "View a QR Code",
          currentButton: FloatingActionButton(
            heroTag: "View a QR Code",
            mini: true,
            child: Icon(Icons.memory),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => QRDisplayView()));
            },
          )),
    ];

    return UnicornDialer(
        hasBackground: false,
        parentButtonBackground: SuperColors.white,
        parentButton: Icon(Icons.add),
        childButtons: childButtons);
  }
}
