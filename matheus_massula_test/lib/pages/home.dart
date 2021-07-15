import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:matheus_massula_test/pages/qr_code.dart';
import 'package:matheus_massula_test/resources/string_constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.HOME_PAGE_TITLE.toUpperCase()),
        centerTitle: true,
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.qr_code_2_rounded),
            label: StringConstant.QR_CODE_LABEL,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRCodeContainer()))
          ),
          SpeedDialChild(
            child: Icon(Icons.qr_code_scanner_rounded),
            label: StringConstant.SCAN_LABEL,
            onTap: () => _scanQRCode(context)
          ),
        ],
      )
      //_buildFloatingActionButton(context),
    );
  }

  Future<void> _scanQRCode(BuildContext context) async {
    String result = await FlutterBarcodeScanner.scanBarcode(
      '#f44336',
      StringConstant.GENERIC_CANCEL,
      true,
      ScanMode.QR
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('QR Code data: $result'))
    );
  }
}