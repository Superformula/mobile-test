import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_test/core/resources/extensions.dart';
import 'package:superformula_test/core/resources/injector.dart';
import 'package:superformula_test/domain/use_cases/qr_code_get_seed_use_case.dart';
import 'package:superformula_test/view/blocs/qr_code_bloc/qr_code_bloc.dart';
import 'package:superformula_test/view/blocs/qr_code_history_bloc/qr_code_history_bloc.dart';
import 'package:superformula_test/view/widgets/app_loading_widget.dart';
import 'package:superformula_test/view/widgets/qr_code_error_message.dart';
import 'package:superformula_test/view/widgets/qr_code_header.dart';
import 'package:superformula_test/view/widgets/qr_code_history.dart';
import 'package:superformula_test/view/widgets/qr_code_timer.dart';

class QRCodePage extends StatelessWidget {
  const QRCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QRCodeCubit>(
      create: (context) => QRCodeCubit(
        AppInjector.instance.get<QRCodeGetSeedUseCase>(),
      ),
      child: const QRCodeView(),
    );
  }
}

@visibleForTesting
class QRCodeView extends StatefulWidget {
  const QRCodeView({super.key});

  @override
  State<QRCodeView> createState() => QRCodeViewState();
}

class QRCodeViewState extends State<QRCodeView> {
  late final QRCodeCubit qrCodeCubit;
  late final QRCodeHistoryCubit qrCodeHistoryCubit;

  @override
  void initState() {
    super.initState();
    qrCodeCubit = context.read<QRCodeCubit>()..getSeed();
    qrCodeHistoryCubit = context.read<QRCodeHistoryCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            snap: true,
            title: Text('QR Code'),
          ),
          BlocConsumer<QRCodeCubit, QRCodeState>(
            listener: (context, state) {
              if (state is QRCodeSuccessState) {
                qrCodeHistoryCubit.updateHistory(state.viewModel);
              }
            },
            bloc: qrCodeCubit,
            buildWhen: (previous, current) => current is! QRCodeIdleState,
            builder: (context, state) {
              if (state is QRCodeLoadingState) {
                return const AppLoadingWidget(
                  isFullScreen: true,
                ).toSliver;
              }

              if (state is QRCodeFailedState) {
                return QRCodeErrorMessage(
                  message: state.message,
                  onRefresh: qrCodeCubit.getSeed,
                ).toSliver;
              }

              if (state is QRCodeSuccessState) {
                return QRCodeHeader(state.viewModel.seed);
              }

              return const SizedBox.shrink().toSliver;
            },
          ),
          BlocBuilder<QRCodeCubit, QRCodeState>(
            bloc: qrCodeCubit,
            buildWhen: (previous, current) => current is QRCodeSuccessState,
            builder: (context, state) {
              if (state is! QRCodeSuccessState) {
                return const SizedBox.shrink().toSliver;
              }

              if (state.viewModel.expiresAt == null) {
                return const SizedBox.shrink().toSliver;
              }

              return SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: QRCodeTimerWidget(
                  state.viewModel.expiresAt!,
                ).toSliver,
              );
            },
          ),
          BlocBuilder<QRCodeHistoryCubit, QRCodeHistoryState>(
            builder: (context, state) {
              if (state.qrCodeList.isEmpty || state.qrCodeList.length == 1) {
                return const SizedBox.shrink().toSliver;
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('History', style: context.textTheme.bodyLarge),
              ).toSliver;
            },
          ),
          BlocBuilder<QRCodeHistoryCubit, QRCodeHistoryState>(
            builder: (context, state) {
              if (state.qrCodeList.isEmpty || state.qrCodeList.length == 1) {
                return const SizedBox.shrink().toSliver;
              }

              return QRCodeHistory(qrCodeList: state.qrCodeList);
            },
          )
        ],
      ),
    );
  }
}
