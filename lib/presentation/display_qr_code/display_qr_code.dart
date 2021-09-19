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
            ..add(const DisplayQrCodeEvent.started())
            ..add(const DisplayQrCodeEvent.requestNewQrCode());
          return bloc;
        },
        child: BlocConsumer<DisplayQrCodeBloc, DisplayQrCodeState>(
          listener: (context, state) {
            // return Container();
          },
          builder: (context, state) {
            const size = 280.0;
            if (state.qrSeed == null) {
              return const SizedBox(
                width: size,
                height: size,
              );
            }

            // Force unwrapp because we already checked for nullity
            if (state.qrSeed != null && state.qrSeed!.seed.isValid()) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomPaint(
                      size: const Size.square(size),
                      painter: QrPainter(
                        data: state.qrSeed!.seed.getOrCrash(),
                        version: QrVersions.auto,
                        eyeStyle: const QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: Color(0xFF673AB7),
                        ),
                        dataModuleStyle: const QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.circle,
                          color: Color(0xFF673AB7),
                          // Colors.deepPurple
                        ),
                        // size: 320.0,
                        // embeddedImage: snapshot.data,
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          size: const Size.square(60),
                        ),
                      ),
                    ),
                    QRCodeExpirationDateTimer(
                      expirationDate: state.qrSeed!.expiresAt,
                    ),
                  ],
                ),
              );
            }

            return const SizedBox(width: size, height: size);
          },
        ),
      ),
    );
  }
}
