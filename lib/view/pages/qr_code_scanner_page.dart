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
            Stack(
              children: [
                SizedBox(
                  width: context.screenWidth * 0.8,
                  height: context.screenWidth * 0.8,
                  child: RepaintBoundary(
                    child: MobileScanner(
                      controller: mobileScannerController,
                      onDetect: (information) {
                        if (information
                                .barcodes.first.displayValue?.isNotEmpty ??
                            false) {
                          AppSnackBar(information.barcodes.first.displayValue!)
                              .show(context);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: context.screenWidth * 0.8,
                  height: context.screenWidth * 0.8,
                  child: CustomPaint(painter: ScannerOverlayPainter()),
                ),
              ],
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

class ScannerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 4
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    const borderSize = 20.0;

    // Top Left
    canvas.drawLine(Offset.zero, const Offset(borderSize, 0), paint);
    canvas.drawLine(Offset.zero, const Offset(0, borderSize), paint);

    // Bottom Left
    canvas.drawLine(
      Offset(0, size.height),
      Offset(borderSize, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(0, size.height),
      Offset(0, size.height - borderSize),
      paint,
    );

    // Top Right
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width, borderSize),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width - borderSize, 0),
      paint,
    );

    // Bottom Right
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width - borderSize, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width, size.height - borderSize),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
