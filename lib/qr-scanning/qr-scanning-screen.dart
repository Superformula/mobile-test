import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_generator/providers/bloc-provider.dart';
import 'package:qr_generator/qr-scanning/qr-scanning-bloc.dart';

class QRScanningScreen extends StatefulWidget {
  
  QRScanningScreen({ Key? key }) : super(key: key);

  @override
  _QRScanningScreenState createState() => _QRScanningScreenState();
}

class _QRScanningScreenState extends State<QRScanningScreen> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRScanningBloc bloc;

  static const double _SCAN_AREA_PADDING = 60;

  @override
  void initState() {
    super.initState();

    bloc = BlocProvider.maybeOf<QRScanningBloc>(context);

  }

  Future<void> _showCodeCaptureDialog(String qrCode) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('QR code scanned!'),
          content: Text('You scanned the code: $qrCode'),
          actions: <Widget>[
            TextButton(
              child: Text("Exit"),
              onPressed: () {
                // pop twice to clear dialog and exit screen
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Scan Another'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _listenForQRCapture(QRViewController viewController) async {
    viewController.scannedDataStream.listen((Barcode capture) async {
      // if the camera detects a valid qr code
      // pause the camera and capture the code for validation
      if(capture.format == BarcodeFormat.qrcode) {
        viewController.pauseCamera();
        await bloc.validateCode(capture);

        // for demonstration purposes only
        // show scan result
        await _showCodeCaptureDialog(capture.code);
        // resume camera if "Scan Another" button is pressed
        viewController.resumeCamera();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return QRView(
            key: qrKey,
            onQRViewCreated: _listenForQRCapture,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: orientation == Orientation.portrait
                  // if portrait mode, scan area is contained to smallest screen dimension with padding
                  ? MediaQuery.of(context).size.width - _SCAN_AREA_PADDING
                  // if landscape mode, scan area is contained to smallest screen dimension, accouting
                  // for app bar height, and padding
                  : (MediaQuery.of(context).size.height - kToolbarHeight) - _SCAN_AREA_PADDING),
          );
        }
      ),
    );
  }
}