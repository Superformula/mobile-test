import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:massula_test/cubit/qr_code/cubit/qr_code_cubit.dart';
import 'package:massula_test/models/remote/qr_code_seed.dart';
import 'package:massula_test/resources/string_constant.dart';
import 'package:massula_test/services/http/qr_code_web_client.dart';
import 'widgets/center_circular_progress_indicator.dart';
import 'widgets/center_error_message.dart';
import 'widgets/qr_code_display.dart';

class QRCodeContainer extends StatelessWidget {
  const QRCodeContainer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qrCodeWebClient = RepositoryProvider.of<QRCodeWebClient>(context);

    return BlocProvider(
      create: (BuildContext context) => QrCodeCubit(qrCodeWebClient: qrCodeWebClient),
      child: _QRCodePage(),
    );
  }
}

class _QRCodePage extends StatelessWidget {
  const _QRCodePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.QR_CODE_PAGE_TITLE),
        centerTitle: true,
      ),
      body: BlocBuilder<QrCodeCubit, QrCodeState>(
        builder: (context, state) {
          if(state is QrCodeLoaded) {
            return QRCodeDisplay(
              content: state.qrCodeSeed.seed!,
              durationInSeconds: _getSecondsFromExpiresAt(state.qrCodeSeed),
              onEnd: () => context.read<QrCodeCubit>().getQRCode()
            );
          } else if(state is QrCodeError) {
            return CenterErrorMessage(
              message: state.message,
              action: () => context.read<QrCodeCubit>().getQRCode()
            );
          } else {
            return CenterCircularProgressIndicator();
          }
        },
      ),
    );
  }

  int _getSecondsFromExpiresAt(QRCodeSeed qrCodeSeed) {
    if (qrCodeSeed.expiresAt != null) {
      return qrCodeSeed.expiresAt!.difference(DateTime.now()).inSeconds;
    }
    return 10;
  }
}