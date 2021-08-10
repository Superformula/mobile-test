import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrdemo/providers/firestore_provider.dart';
import 'package:qrdemo/providers/qr_provider.dart';
import 'package:qrdemo/providers/routing_provider.dart';
import 'package:qrdemo/providers/timer_provider.dart';
import 'package:qrdemo/styles/textstyles.dart';

class ScannerScreen extends StatefulWidget {
  ScannerScreen({Key? key}) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  Barcode? result;

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      await controller.pauseCamera();
      bool confirmed =
          await Provider.of<FirestoreProvider>(context, listen: false)
              .confirmScan(scanData, context);
      if (!confirmed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'QR Expired!',
                ),
                TextButton(
                  child: Text('Get a code', style: snackbar),
                  onPressed: () async {
                    Provider.of<TimerProvider>(context, listen: false).reset();
                    Provider.of<TimerProvider>(context, listen: false)
                        .cancelTimer();
                    Provider.of<QRProvider>(context, listen: false)
                        .generateCode();
                    Provider.of<RoutingProvider>(context, listen: false)
                        .goToQRScreen(context);
                  },
                ),
              ],
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Code Scanned!'),
                TextButton(
                  child: Text('See history', style: snackbar),
                  onPressed: () async {
                    Provider.of<RoutingProvider>(context, listen: false)
                        .goToHistoryScreen(context);
                  },
                ),
              ],
            ),
          ),
        );
      }
      Provider.of<RoutingProvider>(context, listen: false)
          .goToHomeScreen(context);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
