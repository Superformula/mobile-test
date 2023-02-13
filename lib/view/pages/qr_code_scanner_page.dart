import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:superformula_test/core/resources/extensions.dart';
import 'package:superformula_test/core/resources/injector.dart';
import 'package:superformula_test/core/theme/app_colors.dart';
import 'package:superformula_test/view/blocs/qr_code_validation_bloc/qr_code_validation_bloc.dart';
import 'package:superformula_test/view/widgets/qr_code_scanner_bottom_sheet.dart';

class QRCodeScannerPage extends StatelessWidget {
  const QRCodeScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QRCodeValidationCubit(AppInjector.instance.get()),
      child: const _QRCodeScannerView(),
    );
  }
}

class _QRCodeScannerView extends StatefulWidget {
  const _QRCodeScannerView();

  @override
  State<_QRCodeScannerView> createState() => _QRCodeScannerViewState();
}

class _QRCodeScannerViewState extends State<_QRCodeScannerView> {
  late final MobileScannerController mobileScannerController;
  late final QRCodeValidationCubit qrCodeValidationCubit;

  @override
  void initState() {
    super.initState();
    mobileScannerController = MobileScannerController(
      formats: [BarcodeFormat.qrCode],
    );
    qrCodeValidationCubit = context.read<QRCodeValidationCubit>();
  }

  @override
  void dispose() {
    mobileScannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan')),
      body: BlocListener<QRCodeValidationCubit, QRCodeValidationState>(
        listener: (context, state) {
          if (state is QRCodeValidationLoadingState) {
            showBottomSheet(
              context: context,
              builder: (context) => QRCodeScannerBottomSheet(data: state.data),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            );
          }
        },
        child: Center(
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
                            if (qrCodeValidationCubit.state
                                is! QRCodeValidationLoadingState) {
                              qrCodeValidationCubit.validateQRCode(
                                information.barcodes.last.displayValue!,
                              );
                            }
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
