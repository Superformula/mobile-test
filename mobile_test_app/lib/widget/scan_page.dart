import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_test_app/repository/qr_repository.dart';
import 'package:mobile_test_app/scan_cubit/scan_cubit.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  String qrText;
  ScanCubit scanCubit;

  QRViewController controller;
@override
  void initState() {
    scanCubit  = ScanCubit(repository: GetIt.I<QrRepository>());
    super.initState();
  }
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanCubit, ScanState>(
      cubit: scanCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: NotificationListener<SizeChangedLayoutNotification>(
                  onNotification: (notification) {
                    Future.microtask(() => controller?.updateDimensions(qrKey));
                    return false;
                  },
                  child: SizeChangedLayoutNotifier(
                    key: const Key('qr-size-notifier'),
                    child: Stack(
                      children: [
                        QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                        ),
                        if (state is ScannedState)
                          Positioned.fill(
                              child: Center(
                            child: RaisedButton.icon(
                                onPressed: () {
                                  controller.resumeCamera();
                                  scanCubit.reset();
                                },
                                icon: Icon(Icons.camera),
                                label: Text('Scan Again')),
                          ))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: _getBottomColor(state),
                  child: Center(
                    child: Text(_getCenterText(state)),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  String _getCenterText(ScanState state) {
    if (state is CodeValidState) {
      return 'Code is valid';
    } else if (state is CodeInvalidState) {
      return 'Code is invalid';
    } else if (state is CodeValidatingState) {
      return 'Validating...';
    } else {
      return 'Scan a QR code';
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      scanCubit.validateCode(scanData.code);
      controller.pauseCamera();
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    scanCubit.close();
    super.dispose();
  }

  Color _getBottomColor(ScanState state) {
    if (state is CodeValidState) {
      return Colors.green;
    } else if (state is CodeInvalidState) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }
}
