import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/qr_scan_provider.dart';

import 'qr_scan_page.i18n.dart';

///
/// * [QRCodeScanPage]
///
class QRCodeScanPage extends StatelessWidget {
  /// Scan/tests generated QR codes.
  const QRCodeScanPage({Key key}) : super(key: key);

  /// Static method to return the widget as a PageRoute
  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => const QRCodeScanPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kQRCodeScanMessage.i18n)),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera),
        onPressed: () async {
          await context.read(scanQRCode.future);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
