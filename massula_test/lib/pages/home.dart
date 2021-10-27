import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:massula_test/resources/string_constant.dart';

import 'qr_code.dart';

final homeFloatingActionButtonKey = Key('homeFloatingActionButtonKey');
final goToQRCodePageButtonKey = Key('goToQRCodePageButtonKey');
class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.HOME_PAGE_TITLE.toUpperCase()),
      ),
      floatingActionButton: SpeedDial(
        key: homeFloatingActionButtonKey,
        icon: Icons.add,
        activeIcon: Icons.close,
        visible: true,
        children: [
          SpeedDialChild(
            key: goToQRCodePageButtonKey,
            child: Icon(Icons.qr_code_2_rounded),
            label: StringConstant.QR_CODE_LABEL,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrCodeContainer()))
          ),
          SpeedDialChild(
            child: Icon(Icons.qr_code_scanner_rounded),
            label: StringConstant.SCAN_LABEL,
            onTap: () => _scanQRCode(context)
          ),
        ],
      )
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