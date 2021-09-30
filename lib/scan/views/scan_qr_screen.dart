import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test/base/result_state.dart';
import 'package:mobile_test/scan/cubit/scan_qr_cubit.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrScreen extends StatelessWidget {
  const ScanQrScreen({Key? key}) : super(key: key);

  static Widget init() {
    return BlocProvider(
      create: (_) => ScanQrCubit(),
      child: const ScanQrScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final qrKey = GlobalKey(debugLabel: 'qr_key');

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR code')),
      body: Stack(
        children: [
          BlocConsumer<ScanQrCubit, ResultState<String>>(
            listener: (context, state) {
              state.whenOrNull(
                data: (data) async {
                  await showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Qr code scanned'),
                        content: Text(data),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Ok'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                },
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Something goes wrong :('),
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              return QRView(
                key: qrKey,
                onQRViewCreated: (controller) {
                  controller.scannedDataStream.listen((event) {
                    context.read<ScanQrCubit>().scanQrCodeSuccess(event.code);
                  });
                },
                overlay: QrScannerOverlayShape(
                  borderColor: theme.focusColor,
                  borderRadius: 8,
                  borderWidth: 8,
                  borderLength: 16,
                  cutOutSize: 300,
                ),
                onPermissionSet: (controller, permission) {
                  if (!permission) {
                    context
                        .read<ScanQrCubit>()
                        .scanQrCodeFailure('Permission not granted.');
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
