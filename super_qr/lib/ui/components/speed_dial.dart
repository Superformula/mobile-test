// Let's utilize https://github.com/tiagojencmartins/unicornspeeddial to save
// time customly implementing something we don't need to. If we were to
// roll a custom solution (needing something the library doesn't provide)
// I'd use an array of buttons to populate above the main button we always show,
// rendering those buttons above onPress.

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:super_qr/ui/qr_display.dart';
import 'package:super_qr/utils/colors.dart';
import 'package:super_qr/utils/utils.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:validators/validators.dart';

class HomeSpeedDial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of child buttons here for access to context
    final childButtons = [
      // Scan QR Code
      UnicornButton(
          hasLabel: true,
          labelText: "Scan QR Code",
          currentButton: FloatingActionButton(
            heroTag: "Scan QR Code",
            mini: true,
            child: Icon(Icons.camera_alt),
            onPressed: () async {
              await scanQRCode(context);
            },
          )),
      // View a QR Code
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

  Future scanQRCode(BuildContext context) async {
    // TODO: Check if running on sim crashes
    String scanResult =
        await FlutterBarcodeScanner.scanBarcode("#661FFF", "Nevermind", true)
            .catchError((e) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              "There was an error reading that QR Code, please try again. If the problem persists, it may be a corrupt code."),
          duration: Duration(milliseconds: 4000)));
    });

    if (scanResult.isEmpty) {
      return;
    }

    // If the user scans a QR Code that is a link, let's ask them if they'd
    // like to go to it.
    if (isURL(scanResult)) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Would you like to open $scanResult?"),
        action: SnackBarAction(
            label: "Open",
            onPressed: () {
              openUrl(scanResult);
            }),
        duration: Duration(milliseconds: 4000),
      ));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("QR Code found: $scanResult"),
          duration: Duration(milliseconds: 4000)));
    }
  }
}
