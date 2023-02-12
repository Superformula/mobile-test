import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:superformula_test/core/resources/extensions.dart';
import 'package:superformula_test/core/theme/app_colors.dart';
import 'package:superformula_test/view/widgets/snackbar.dart';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({super.key});

  @override
  State<QRCodeScannerPage> createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  late final MobileScannerController mobileScannerController;

  @override
  void initState() {
    super.initState();
    mobileScannerController = MobileScannerController(
      formats: [BarcodeFormat.qrCode],
    );
  }

  @override
  void dispose() {
    super.dispose();
    mobileScannerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: context.screenWidth * 0.8,
                height: context.screenWidth * 0.8,
                child: RepaintBoundary(
                  child: MobileScanner(
                    controller: mobileScannerController,
                    onDetect: (information) {
                      if (information.barcodes.first.displayValue?.isNotEmpty ??
                          false) {
                        AppSnackBar(information.barcodes.first.displayValue!)
                            .show(context);
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'QR Code Scanner',
              style: context.textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
