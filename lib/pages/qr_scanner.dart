import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:superformula_test/domain/qr_code/provider/scanner_provider.dart';
import 'package:superformula_test/router/router.dart';

class QrScannerPage extends StatefulWidget {
  QrScannerPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _QrCodePageState createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrScannerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title ?? '',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: ChangeNotifierProvider(
          create: (_) => ScannerProvider(),
          builder: (context, snapshot) {
            return Consumer<ScannerProvider>(
                builder: (context, provider, snapshot) {
              return Column(
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: QRView(
                          key: qrKey,
                          overlay: QrScannerOverlayShape(
                              borderColor: Theme.of(context).accentColor,
                              borderRadius: 10,
                              borderLength: 30,
                              borderWidth: 10,
                              cutOutSize: 250),
                          onQRViewCreated: (controller) {
                            controller.scannedDataStream
                                .listen((scanData) async {
                              controller.pauseCamera();
                              await provider.resolveDataScan(scanData);
                              createDialog(
                                  title: provider.format,
                                  value: provider.result,
                                  onPress: () {
                                    provider.clearData();
                                    Navigator.pop(context);
                                    controller.resumeCamera();
                                  });
                            });
                          },
                          onPermissionSet: (ctrl, setValue) =>
                              _onPermissionSet(context, ctrl, setValue))),
                ],
              );
            });
          }),
    );
  }

  void _onPermissionSet(
      BuildContext context, QRViewController ctrl, bool setValue) {
    if (!setValue) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  void createDialog(
      {required String? title,
      required String? value,
      required Function? onPress()}) {
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Theme.of(context).accentColor.withOpacity(0.1),
        builder: (_) => AlertDialog(
              title: Text(title?.toUpperCase() ?? ''),
              content: Text(value ?? ''),
              actions: [
                TextButton(
                  onPressed: onPress,
                  child: Text('OK'),
                ),
              ],
            ));
  }
}
