import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_generator_flutter/src/core/styles/app_colors.dart';
import 'package:qr_generator_flutter/src/core/styles/app_text_styles.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/views/qr_scanner_page_i18n.dart';

///Key for testing
final kScannerBody = UniqueKey();

///Key for testing
final kQrScanButton = UniqueKey();

///QrScannerPage
class QrScannerPage extends StatefulWidget {
  ///Router for QrScannerPage
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => QrScannerPage());
  }

  @override
  _QrScannerPageState createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  String _scanBarcode = kNoCodeScanned.i18n;

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kQrScan.i18n)),
      body: Center(
        child: _ScannerBody(
          key: kScannerBody,
          scanCode: _scanBarcode,
          scanQr: scanQR,
        ),
      ),
    );
  }
}

class _ScannerBody extends StatelessWidget {
  const _ScannerBody({
    Key key,
    this.scanQr,
    this.scanCode,
  }) : super(key: key);

  final VoidCallback scanQr;
  final String scanCode;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          key: kQrScanButton,
          color: AppColors.pink,
          onPressed: scanQr,
          child: Text(
            kStartScan.i18n,
            style: AppTextStyle.white,
          ),
        ),
        const SizedBox(height: 30.0),
        Text(
          '${kScanResult.i18n}\n(${kLongPressToCopy.i18n}) : ',
          style: AppTextStyle.white,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30.0),
        GestureDetector(
          onLongPress: () {
            Clipboard.setData(ClipboardData(text: scanCode));
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(kTextCopied.i18n)),
            );
          },
          child: Text(
            '$scanCode',
            style: AppTextStyle.code,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
