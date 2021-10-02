import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:superformula_mobile_test/application/display_qr_code/display_qr_code_bloc.dart';
import 'package:superformula_mobile_test/presentation/core/misc/colors.dart';
import 'package:superformula_mobile_test/presentation/display_qr_code/widgets/expiration_date_timer.dart';
import 'package:superformula_mobile_test/presentation/display_qr_code/widgets/qr_code_error_widget.dart';

class DisplayQrCodeScreen extends StatelessWidget {
  const DisplayQrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Qr Code'),
      ),
      body: BlocProvider(
        create: (context) {
          final bloc = DisplayQrCodeBloc()
            ..add(const DisplayQrCodeEvent.requestedNewQrCode());
          return bloc;
        },
        child: BlocConsumer<DisplayQrCodeBloc, DisplayQrCodeState>(
          listener: (context, state) {
            state.map(initial: (st) {
              // empty
            }, loadInProgress: (st) {
              // empty
            }, loadSuccess: (st) {
              // empty
            }, loadFailure: (failure) {
              final message = failure.qrcodeFailure.when(unexpected: () {
                return 'An unexpected error occurred, please try again or restart the app.';
              }, serverFailure: () {
                return 'Ops, there was an error on our side, please try again.';
              }, cacheFailure: () {
                return 'Ops, there was an error on our app side, please try again.';
              }, connectivityFailure: () {
                return 'We couldnt reach our server, please make sure the device is connected to the internet.';
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: superformulaPrimaryColor,
                  content: Text(message),
                ),
              );
            });
          },
          builder: (context, state) {
            return OrientationBuilder(builder: (context, orientation) {
              return state.map(
                initial: (s) => Container(),
                loadFailure: (s) {
                  return const QrCodeErrorWidget();
                },
                loadInProgress: (s) {
                  return const Center(child: CircularProgressIndicator());
                },
                loadSuccess: (s) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPaint(
                          size: orientation == Orientation.portrait
                              ? Size.square(
                                  MediaQuery.of(context).size.height * 0.4)
                              : Size.square(
                                  MediaQuery.of(context).size.height * 0.6),
                          painter: QrPainter(
                            data: s.qrcode.seed.getOrCrash(),
                            version: QrVersions.auto,
                            eyeStyle: const QrEyeStyle(
                              eyeShape: QrEyeShape.circle,
                              color: superformulaBackgroundColor,
                            ),
                            dataModuleStyle: const QrDataModuleStyle(
                              dataModuleShape: QrDataModuleShape.circle,
                              color: superformulaBackgroundColor,
                            ),
                          ),
                        ),
                        QRCodeExpirationDateTimer(
                          expirationDate: s.qrcode.expiresAt,
                        )
                      ],
                    ),
                  );
                },
              );
            });
          },
        ),
      ),
    );
  }
}
