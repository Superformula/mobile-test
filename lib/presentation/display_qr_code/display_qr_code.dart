import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superformula_mobile_test/application/display_qr_code/display_qr_code_bloc.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_repository.dart';
import 'package:superformula_mobile_test/domain/platform/i_network_info.dart';
import 'package:superformula_mobile_test/locator.dart';
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
          final bloc = DisplayQrCodeBloc(
              locator<IQrSeedRepository>(), locator<INetworkInfo>())
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
            }, loadFailure: (st) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    backgroundColor: superformulaPrimaryColor,
                    content: Text(
                        'There was an error while trying to get the QR code, try Again.')),
              );
            });
          },
          builder: (context, state) {
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
                        size: const Size.square(280),
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
          },
        ),
      ),
    );
  }
}
