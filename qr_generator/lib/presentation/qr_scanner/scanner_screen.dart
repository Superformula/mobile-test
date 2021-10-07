import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_generator/domain/qr_scanner/cubit/scanner_cubit.dart';

class QRScannerScreen extends StatelessWidget {
  const QRScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScannerCubit>(
      create: (_) => ScannerCubit(),
      child: _QRScanner(),
    );
  }
}

class _QRScanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: BlocBuilder<ScannerCubit, ScannerState>(
        builder: (_, state) => Column(
          children: [
            Expanded(
              flex: 7,
              child: QRView(
                key: qrKey,
                overlay: QrScannerOverlayShape(
                  borderColor: Theme.of(context).colorScheme.secondary,
                  borderWidth: 8,
                  borderRadius: 10,
                ),
                onQRViewCreated: (QRViewController controller) => {
                  controller.scannedDataStream.listen((Barcode scanData) {
                    context.read<ScannerCubit>().processBarcode(scanData);
                  })
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  state is ValidScanState
                      ? state.scanValue.code
                      : 'Point into a QR Code to scan!',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
