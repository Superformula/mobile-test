import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:superformula_leandro/core/constants/strings_constants.dart';
import 'package:superformula_leandro/core/extensions/screen_size_extension.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/qr_code/qr_code_cubit.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/timer/timer_cubit.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  late final TimerCubit _timerCubit;
  late final QrCodeCubit _qrCodeCubit;

  @override
  void initState() {
    super.initState();
    _qrCodeCubit = context.read<QrCodeCubit>()..getQrCode();
    _timerCubit = context.read<TimerCubit>();
  }

  @override
  void dispose() {
    _timerCubit.disposeTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<QrCodeCubit, QrCodeState>(
          bloc: _qrCodeCubit,
          listenWhen: (previousState, currentState) =>
              previousState is QrCodeLoadingState &&
              currentState is QrCodeLoadedState,
          listener: (context, state) {
            if (state is QrCodeLoadedState) {
              _timerCubit.startTimer(finishAt: state.qrCodeEntity.expireAt);
            }
          },
        ),
        BlocListener<TimerCubit, TimerState>(
          bloc: _timerCubit,
          listenWhen: (previousState, currentState) =>
              previousState is TimerInProgressState &&
              currentState is TimerFinishedState,
          listener: (context, state) {
            _qrCodeCubit.getQrCode();
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringsConstants.qrCode),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: BlocBuilder<TimerCubit, TimerState>(
              bloc: _timerCubit,
              builder: (context, state) {
                return BlocBuilder<QrCodeCubit, QrCodeState>(
                  bloc: _qrCodeCubit,
                  builder: (context, state) {
                    return switch (state) {
                      QrCodeLoadedState() => SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              QrImageView(
                                data: state.qrCodeEntity.seed,
                                padding: EdgeInsets.zero,
                              ),
                              const SizedBox(height: 16),
                              BlocBuilder<TimerCubit, TimerState>(
                                  bloc: _timerCubit,
                                  builder: (context, state) {
                                    return switch (state) {
                                      TimerInProgressState() => Text(
                                          '${state.remainingSeconds}s',
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                      TimerFinishedState() =>
                                        const Text(StringsConstants.expired),
                                      _ => const SizedBox.shrink()
                                    };
                                  })
                            ],
                          ),
                        ),
                      QrCodeErrorState() => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.warning_rounded,
                              size: context.screenHeight * .2,
                              color: Colors.red,
                            ),
                            const SizedBox(height: 16),
                            Text(state.errorMessage),
                          ],
                        ),
                      _ => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade200,
                              period: const Duration(seconds: 1),
                              child: SizedBox.square(
                                dimension: 330,
                                child: Container(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade200,
                              period: const Duration(seconds: 1),
                              child: SizedBox.square(
                                dimension: 24,
                                child: Container(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                    };
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<QrCodeCubit, QrCodeState>(
          bloc: _qrCodeCubit,
          builder: (context, state) {
            return switch (state) {
              QrCodeErrorState() => Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: _qrCodeCubit.getQrCode,
                    child: const Text('Try again'),
                  ),
                ),
              _ => const SizedBox.shrink()
            };
          },
        ),
      ),
    );
  }
}
