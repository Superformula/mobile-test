import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superformula_leandro/core/extensions/build_context_extension.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/qr_code/qr_code_cubit.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/timer/timer_cubit.dart';

class QrCodeLoadedBodyWidget extends StatefulWidget {
  const QrCodeLoadedBodyWidget(
      {required QrCodeLoadedState qrCodeLoadedState, super.key})
      : _qrCodeLoadedState = qrCodeLoadedState;

  final QrCodeLoadedState _qrCodeLoadedState;

  @override
  State<QrCodeLoadedBodyWidget> createState() => _QrCodeLoadedBodyWidgetState();
}

class _QrCodeLoadedBodyWidgetState extends State<QrCodeLoadedBodyWidget> {
  late final TimerCubit _timerCubit;

  @override
  void initState() {
    super.initState();
    _timerCubit = context.read<TimerCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImageView(
            size: context.screenWidth * .8,
            data: widget._qrCodeLoadedState.qrCodeEntity.seed,
            padding: EdgeInsets.zero,
          ),
          BlocBuilder<TimerCubit, TimerState>(
            bloc: _timerCubit,
            builder: (context, state) {
              return switch (state) {
                TimerInProgressState() => Column(
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        '${state.remainingSeconds}s',
                        style: context.textTheme.headlineMedium,
                      ),
                    ],
                  ),
                _ => const SizedBox.shrink()
              };
            },
          )
        ],
      ),
    );
  }
}
