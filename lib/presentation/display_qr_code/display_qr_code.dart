import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superformula_mobile_test/application/display_qr_code/display_qr_code_bloc.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_repository.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_expiration_date.dart';
import 'package:superformula_mobile_test/locator.dart';
import 'package:superformula_mobile_test/presentation/display_qr_code/widgets/expiration_date_timer.dart';

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
          final bloc = DisplayQrCodeBloc(locator<IQrSeedRepository>())
            // ..add(const DisplayQrCodeEvent.started())
            ..add(const DisplayQrCodeEvent.requestedNewQrCode());
          return bloc;
        },
        child: BlocConsumer<DisplayQrCodeBloc, DisplayQrCodeState>(
          listener: (context, state) {
            // return Container();
          },
          builder: (context, state) {
            return state.map(
              initial: (s) => Container(),
              loadFailure: (s) {
                return Text(s.qrcodeFailure.toString());
              },
              loadInProgress: (s) {
                return const Center(child: CircularProgressIndicator());
              },
              loadSuccess: (s) {
                const size = 280.0;

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPaint(
                        size: const Size.square(size),
                        painter: QrPainter(
                          data: s.qrcode.seed.getOrCrash(),
                          version: QrVersions.auto,
                          eyeStyle: const QrEyeStyle(
                            eyeShape: QrEyeShape.square,
                            color: Color(0xFF673AB7),
                          ),
                          dataModuleStyle: const QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.circle,
                            color: Color(0xFF673AB7),
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
          },
        ),
      ),
    );
  }
}
