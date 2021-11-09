import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_generator/screens/scan_view/bloc/scan_view_bloc.dart';
import 'package:qr_generator/screens/widgets/error_view.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanView extends StatefulWidget {
  ScanView({Key key}) : super(key: key);

  @override
  _ScanViewState createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  ThemeData _theme;
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan View'),
        actions: [
          IconButton(
              onPressed: () async => await controller?.pauseCamera(),
              icon: const Icon(Icons.pause)),
          IconButton(
              onPressed: () async => await controller?.resumeCamera(),
              icon: const Icon(Icons.play_arrow))
        ],
      ),
      body: SafeArea(
        child: BlocListener<ScanViewBloc, ScanViewStateBloc>(
            listener: (context, state) {
          if (state.scanStatus == ScanStatus.loaded) {
            _showBottomSheet(
                context,
                ListTile(
                  leading: CircleAvatar(
                      backgroundColor:
                          state.seedValidated ? Colors.green : Colors.red,
                      child: Icon(
                        state.seedValidated ? Icons.check : Icons.close,
                        color: Colors.white,
                      )),
                  title: Text(state.seedValidated ? 'Valid' : 'Invalid'),
                  subtitle: Text(state.seedData),
                ));
          }
        }, child: BlocBuilder<ScanViewBloc, ScanViewStateBloc>(
          builder: (context, state) {
            if (state.scanStatus == ScanStatus.loaded) {
              return BlocProvider.value(
                value: BlocProvider.of<ScanViewBloc>(context),
                child: buildQrView(context),
              );
            }
            if (state.scanStatus == ScanStatus.failure) {
              return ErrorView(
                error: state.errorMessage,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )),
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.green,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _showBottomSheet(BuildContext context, Widget body,
      {bool isDismissible = true, bool enableDrag = true}) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      elevation: 3,
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return body;
      },
    ).then((_) async {
      await controller.resumeCamera();
      BlocProvider.of<ScanViewBloc>(context).add(RestartScanData());
    });
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      await controller.pauseCamera();
      BlocProvider.of<ScanViewBloc>(context).add(ValidateSeed(scanData));
    });
  }

  void _onPermissionSet(
      BuildContext context, QRViewController ctrl, bool p) async {
    if (!await Permission.camera.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
