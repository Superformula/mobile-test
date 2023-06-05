import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_code/qr_code/cubit/qr_code_cubit.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeView extends StatelessWidget {
  const QrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLocalizations.qrCode,
        ),
      ),
      body: BlocBuilder<QrCodeCubit, QrCodeState>(
        builder: (context, state) {
          switch (state.status) {
            case QrCodeStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case QrCodeStatus.success:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.qrCode != null)
                    Center(
                      child: QrImageView(
                        data: state.qrCode!.seed,
                        size: 240,
                      ),
                    ),
                  if (state.duration != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(state.duration.toString()),
                    )
                ],
              );
            case QrCodeStatus.failure:
              return Center(child: Text(appLocalizations.failedFetchQrCode));
          }
        },
      ),
    );
  }
}
