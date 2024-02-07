import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_leandro/core/constants/strings_constants.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/timer/timer_cubit.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  late final TimerCubit _timerCubit;

  @override
  void initState() {
    super.initState();
    _timerCubit = context.read<TimerCubit>()..startTimer(durationSeconds: 15);
  }

  @override
  void dispose() {
    _timerCubit.disposeTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsConstants.qrCode),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.qr_code_scanner_rounded, size: 150),
            const SizedBox(height: 16),
            BlocBuilder<TimerCubit, TimerState>(
                bloc: _timerCubit,
                builder: (context, state) {
                  return switch (state) {
                    TimerInProgressState() => Text('${state.remainingSeconds}'),
                    TimerFinishedState() =>
                      const Text(StringsConstants.expired),
                    _ => const SizedBox.shrink()
                  };
                }),
          ],
        ),
      ),
    );
  }
}
