import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_generator/qr_generator.dart';

import 'package:qr_generator_flutter/src/core/styles/app_text_styles.dart';
import 'package:qr_generator_flutter/src/core/styles/app_colors.dart';
import 'package:qr_generator_flutter/src/core/widgets/animated_floating_action_button.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/views/qr_scanner_page.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/views/widgets/expiration_timer.dart';

import '../logic/qr_generator_cubit.dart';
import '../logic/qr_generator_state.dart';

import 'qr_generator_page_i18n.dart';
import 'widgets/qr_code_widget.dart';

///QrGeneratorPage
class QrGeneratorPage extends StatelessWidget {
  ///QrGeneratorPage constructor
  const QrGeneratorPage({Key key}) : super(key: key);

  ///QrGeneratorPage [routeName]
  static const routeName = 'QrGeneratorPage';

  ///Router for QrGeneratorPage
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const QrGeneratorPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kQrGeneratorTitle.i18n),
      ),
      body: Center(
        child: _BlocBuilder(),
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        buttons: [
          CircularButton(
            key: const Key('kGenerateQrButton'),
            icon: Icons.qr_code,
            onClick: () {
              context.read<QrGeneratorCubit>().getSeed();
            },
          ),
          CircularButton(
            key: const Key('kScanQrButton'),
            icon: Icons.qr_code_scanner_outlined,
            onClick: () {
              Navigator.push(context, QrScannerPage.route());
            },
          ),
        ],
      ),
    );
  }
}

class _BlocBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrGeneratorCubit, QrGeneratorState>(
      key: const Key('kBodyKey'),
      builder: (context, state) {
        return state.when(
          initial: () => _Text(text: kWelcomeText.i18n),
          expired: () => _Text(text: kCodeExpired.i18n),
          error: (e) => _Text(text: kError.i18n),
          loading: () => const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
          ),
          data: (seed) => _QrCode(seed: seed),
        );
      },
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40.0,
      ),
      child: Text(
        text,
        style: AppTextStyle.white,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _QrCode extends StatelessWidget {
  const _QrCode({Key key, this.seed}) : super(key: key);
  final Seed seed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        QrCodeWidget(seed: seed),
        const SizedBox(height: 20.0),
        ExpirationTimer(
          expirationDate: seed.expiresAt,
          onExpiration: () {
            context.read<QrGeneratorCubit>().expireCode();
          },
        ),
      ],
    );
  }
}
