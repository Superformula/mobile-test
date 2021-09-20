import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:superformula_mobile_test/application/scan_qr_code/scan_qr_code_bloc.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_repository.dart';
import 'package:superformula_mobile_test/presentation/core/misc/colors.dart';
import 'package:superformula_mobile_test/locator.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({Key? key}) : super(key: key);
  @override
  _ScanQrCodeScreenState createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: superformulaBackgroundColor,
      appBar: AppBar(
        title: const Text('Scan Qr Code'),
      ),
      body: BlocProvider(
        create: (context) {
          final bloc = ScanQrCodeBloc(locator<IQrSeedRepository>())
            ..add(const ScanQrCodeEvent.started());
          return bloc;
        },
        child: BlocConsumer<ScanQrCodeBloc, ScanQrCodeState>(
          listener: (context, state) async {
            if (state.lastCodeValid) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Code is valid ${state.code}')),
              );
            }
          },
          builder: (context, state) {
            if (state.isValidating) {
              return Stack(
                children: <Widget>[
                  Expanded(flex: 4, child: _buildQrView(context, state)),
                  const Center(child: CircularProgressIndicator()),
                ],
              );
            }
            return Stack(
              children: <Widget>[
                Expanded(flex: 4, child: _buildQrView(context, state))
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller?.flipCamera();
        },
        child: const Icon(Icons.flip_camera_android_sharp),
      ),
    );
  }

  Widget _buildQrView(BuildContext context, ScanQrCodeState state) {
    // Ccheck how width or tall the device is and change the scanArea and overlay accordingly.
    final scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: (controller) {
        _onQRViewCreated(controller, context);
      },
      overlay: QrScannerOverlayShape(
          borderColor: superformulaSecondaryColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller, BuildContext context) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      context
          .read<ScanQrCodeBloc>()
          .add(ScanQrCodeEvent.qrCodeScanned(scanData.code));
    });
  }

  void _onPermissionSet(
      BuildContext context, QRViewController ctrl, bool permissionGranted) {
    if (!permissionGranted) {
      context
          .read<ScanQrCodeBloc>()
          .add(const ScanQrCodeEvent.cameraLoadFailed());
    }
  }
}
