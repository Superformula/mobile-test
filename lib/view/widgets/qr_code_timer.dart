import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_test/core/resources/extensions.dart';
import 'package:superformula_test/view/blocs/qr_code_seed_bloc/qr_code_seed_bloc.dart';

class QrCodeTimerWidget extends StatefulWidget {
  const QrCodeTimerWidget(this.expiresAt, {super.key});

  final DateTime expiresAt;

  @override
  State<QrCodeTimerWidget> createState() => QrCodeTimerWidgetState();
}

class QrCodeTimerWidgetState extends State<QrCodeTimerWidget> {
  late Timer countdownTimer;
  late Timer expiresAtTimer;
  late ValueNotifier<int> countdownNotifier;
  late final QrCodeSeedCubit qrCodeSeedCubit;

  @override
  void initState() {
    super.initState();

    qrCodeSeedCubit = context.read<QrCodeSeedCubit>();
    _initializeTimers();
  }

  @override
  void didUpdateWidget(covariant QrCodeTimerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expiresAt != oldWidget.expiresAt) {
      _initializeTimers();
    }
  }

  void _initializeTimers() {
    final dateDifference = widget.expiresAt.difference(DateTime.now());
    countdownNotifier = ValueNotifier(dateDifference.inSeconds);

    expiresAtTimer = Timer(dateDifference, () {
      countdownTimer.cancel();
      qrCodeSeedCubit.getSeed();
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      countdownNotifier.value = dateDifference.inSeconds - timer.tick;
    });
  }

  @override
  void dispose() {
    countdownNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder(
        valueListenable: countdownNotifier,
        builder: (context, value, child) {
          return Text(
            'Expires in:\n$value s',
            style: context.textTheme.titleLarge,
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
