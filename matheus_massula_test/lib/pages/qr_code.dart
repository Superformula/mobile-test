import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matheus_massula_test/cubit/qr_code/cubit/qr_code_cubit.dart';
import 'package:matheus_massula_test/models/remote/qr_code_seed.dart';
import 'package:matheus_massula_test/resources/string_constant.dart';
import 'package:matheus_massula_test/services/http/qr_code_web_client.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'widgets/seconds_count_down.dart';

class QRCodeContainer extends StatelessWidget {
  const QRCodeContainer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qrCodeWebClient = RepositoryProvider.of<QRCodeWebClient>(context);

    return BlocProvider(
      create: (BuildContext context) {
        final cubit = QrCodeCubit(qrCodeWebClient: qrCodeWebClient);
        cubit.getQRCode();
        return cubit;
      },
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
            return _buildLoadedBody(context, state);
          } else if(state is QrCodeError) {
            return _buildErrorBody(context, state);
          } else {
            return _buildLoadingBody();
          }
        },
      ),
    );
  }

  Center _buildLoadingBody() => Center(child: CircularProgressIndicator());

  Column _buildErrorBody(BuildContext context, QrCodeError state) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(
          Icons.error,
          color: Theme.of(context).errorColor,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
        child: Text(state.message),
      ),
      OutlinedButton(
        onPressed: () => context.read<QrCodeCubit>().getQRCode(),
        child: Text(StringConstant.GENERIC_RETRY)
      )
    ],
  );

  Column _buildLoadedBody(BuildContext context, QrCodeLoaded state) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(32.0),
        child: QrImage(
          data: state.qrCodeSeed.seed!,
          version: QrVersions.auto,
          size: 400.0,
        ),
      ),
      SecondsCountDown(
        seconds: _getSecondsFromExpiresAt(state.qrCodeSeed),
        onEnd: () => context.read<QrCodeCubit>().getQRCode()
      )
    ]
  );

  int _getSecondsFromExpiresAt(QRCodeSeed qrCodeSeed) {
    if (qrCodeSeed.expiresAt != null) {
      return qrCodeSeed.expiresAt!.difference(DateTime.now()).inSeconds;
    }
    return 10;
  }
}