import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_leandro/core/constants/strings_constants.dart';
import 'package:superformula_leandro/core/widgets/app_primary_button.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/qr_code/qr_code_cubit.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/timer/timer_cubit.dart';
import 'package:superformula_leandro/core/widgets/app_error_widget.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/pages/qr_code/widgets/qr_code_loaded_body_widget.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/pages/qr_code/widgets/qr_code_loading_body_widget.dart';

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
            child: BlocBuilder<QrCodeCubit, QrCodeState>(
              bloc: _qrCodeCubit,
              builder: (context, state) {
                return switch (state) {
                  QrCodeLoadedState() =>
                    QrCodeLoadedBodyWidget(qrCodeLoadedState: state),
                  QrCodeErrorState() =>
                    AppErrorWidget(errorMessage: state.errorMessage),
                  _ => const QrCodeLoadingBodyWidget(),
                };
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
                  child: AppPrimaryButton(
                    voidCallback: _qrCodeCubit.getQrCode,
                    text: StringsConstants.tryAgain,
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
