import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code/scan/cubit/scan_cubit.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 240,
      height: 240,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLocalizations.scan,
        ),
      ),
      body: BlocConsumer<ScanCubit, ScanState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  appLocalizations.qrCodeValid(
                    state.isValid.toString(),
                  ),
                ),
              ),
            );
        },
        buildWhen: (previous, current) =>
            previous.qrCode != current.qrCode &&
            previous.status != current.status,
        builder: (context, state) {
          switch (state.status) {
            case ScanStatus.initial:
            case ScanStatus.success:
              return Stack(
                fit: StackFit.expand,
                children: [
                  MobileScanner(
                    controller: MobileScannerController(
                      formats: [BarcodeFormat.qrCode],
                    ),
                    scanWindow: scanWindow,
                    onDetect: (capture) {
                      if (capture.barcodes.last.displayValue != null) {
                        final qrCode = capture.barcodes.last.displayValue;
                        context
                            .read<ScanCubit>()
                            .validateQrCode(qrCode: qrCode!);
                      }
                    },
                  ),
                  CustomPaint(
                    painter: ScannerOverlay(scanWindow),
                  ),
                ],
              );
            case ScanStatus.failure:
              return Center(child: Text(appLocalizations.failedFetchQrCode));
          }
        },
      ),
    );
  }
}

class ScannerOverlay extends CustomPainter {
  ScannerOverlay(this.scanWindow);

  final Rect scanWindow;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.largest);
    final cutoutPath = Path()..addRect(scanWindow);

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
