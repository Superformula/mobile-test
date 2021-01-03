import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:qr_code_test/blocs/validation/bloc/validation_bloc.dart';
import 'package:qr_code_test/blocs/validation/validation.dart';
import 'package:qr_code_test/configs/routes.dart';

/// This route shows a QR scanner on the screen which will redirect to a new
/// route to determine whether the scanned code is valid or not.
class QRScanRoute extends StatefulWidget {
  const QRScanRoute();

  @override
  _QRScanRouteState createState() => _QRScanRouteState();
}

class _QRScanRouteState extends State<QRScanRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Scan"),
        centerTitle: true,
      ),
      body: BlocListener<ValidationBloc, ValidationState>(
        listener: (context, state) {
          // When a new code is read from the scanner, a new state is emitted
          // and thus the user must be redirected to a new route which will tell
          // whether the code is valid or not
          if ((state is ValidationSuccess) || (state is ValidationFailed)) {
            Navigator.of(context).pushNamed(RouteGenerator.validateQR);
          }
        },
        child: LayoutBuilder(
          builder: (context, sizes) {
            // The scanner is going to take a good amount of the available space
            // but not entirely
            var boxWidth = sizes.maxWidth / 1.3;
            var boxHeight = sizes.maxHeight / 1.3;

            return Center(
              child: SizedBox(
                height: boxWidth,
                width: boxHeight,
                child: QRBarScannerCamera(
                  qrCodeCallback: (code) =>
                    context.read<ValidationBloc>().add(code),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}