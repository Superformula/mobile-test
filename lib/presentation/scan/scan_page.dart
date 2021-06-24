import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_generator/application/scan_page/scan_page_cubit.dart';
import 'package:qr_generator/injection.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ScanPageCubit>(),
      child: const ScanWidget(),
    );
  }
}

class ScanWidget extends StatefulWidget {
  const ScanWidget({Key? key}) : super(key: key);

  @override
  _ScanWidgetState createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AspectRatio(aspectRatio: 1, child: _buildQrView(context)),
            const SizedBox(height: 32),
            BlocBuilder<ScanPageCubit, ScanPageState>(
                builder: (context, state) {
              return state.map(
                initial: (_) => Text(
                  'Scan a code',
                  style: Theme.of(context).textTheme.headline4,
                ),
                seedScanned: (s) => RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Scanned seed:\n',
                      style: Theme.of(context).textTheme.headline4,
                      children: [
                        TextSpan(
                          text: s.code,
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ],
                    )),
                seedVerified: (_) => Row(
                  children: [
                    Text(
                      'Seed verified',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.check,
                      size: 40,
                      color: Colors.green,
                    )
                  ],
                ),
                seedInvalid: (_) => Text(
                  'Seed is invalid',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).errorColor),
                ),
              );
            })
          ]),
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        clipBehavior: Clip.hardEdge,
        child: QRView(
          key: qrKey,
          onQRViewCreated: (controller) =>
              _onQRViewCreated(context, controller),
          overlay: QrScannerOverlayShape(
            borderRadius: 10,
            borderLength: 20,
            borderWidth: 5,
            cutOutSize: constraints.maxWidth - 20,
          ),
        ),
      );
    });
  }

  void _onQRViewCreated(BuildContext context, QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      context.read<ScanPageCubit>().codeObtained(scanData.code);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
