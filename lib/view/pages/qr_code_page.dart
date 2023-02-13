import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_test/core/resources/extensions.dart';
import 'package:superformula_test/core/resources/injector.dart';
import 'package:superformula_test/domain/use_cases/qr_code_get_seed_use_case.dart';
import 'package:superformula_test/view/blocs/qr_code_history_bloc/qr_code_history_bloc.dart';
import 'package:superformula_test/view/blocs/qr_code_seed_bloc/qr_code_seed_bloc.dart';
import 'package:superformula_test/view/widgets/app_loading_widget.dart';
import 'package:superformula_test/view/widgets/qr_code_error_message.dart';
import 'package:superformula_test/view/widgets/qr_code_header.dart';
import 'package:superformula_test/view/widgets/qr_code_history.dart';
import 'package:superformula_test/view/widgets/qr_code_timer.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QrCodeSeedCubit>(
      create: (context) => QrCodeSeedCubit(
        AppInjector.instance.get<QrCodeGetSeedUseCase>(),
      ),
      child: const QrCodeView(),
    );
  }
}

@visibleForTesting
class QrCodeView extends StatefulWidget {
  const QrCodeView({super.key});

  @override
  State<QrCodeView> createState() => QrCodeViewState();
}

class QrCodeViewState extends State<QrCodeView> {
  late final QrCodeSeedCubit qrCodeSeedCubit;
  late final QrCodeHistoryCubit qrCodeHistoryCubit;

  @override
  void initState() {
    super.initState();
    qrCodeSeedCubit = context.read<QrCodeSeedCubit>()..getSeed();
    qrCodeHistoryCubit = context.read<QrCodeHistoryCubit>();
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
          BlocConsumer<QrCodeSeedCubit, QrCodeSeedState>(
            listener: (context, state) {
              if (state is QrCodeSeedSuccessState) {
                qrCodeHistoryCubit.updateHistory(state.viewModel);
              }
            },
            bloc: qrCodeSeedCubit,
            buildWhen: (previous, current) => current is! QrCodeSeedIdleState,
            builder: (context, state) {
              if (state is QrCodeSeedLoadingState) {
                return const AppLoadingWidget(
                  isFullScreen: true,
                ).toSliver;
              }

              if (state is QrCodeSeedFailedState) {
                return QrCodeErrorMessage(
                  message: state.message,
                  onRefresh: qrCodeSeedCubit.getSeed,
                ).toSliver;
              }

              if (state is QrCodeSeedSuccessState) {
                return QrCodeHeader(state.viewModel.seed);
              }

              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          ),
          BlocBuilder<QrCodeSeedCubit, QrCodeSeedState>(
            bloc: qrCodeSeedCubit,
            buildWhen: (previous, current) => current is QrCodeSeedSuccessState,
            builder: (context, state) {
              if (state is! QrCodeSeedSuccessState) {
                return const SizedBox.shrink().toSliver;
              }

              if (state.viewModel.expiresAt == null) {
                return const SizedBox.shrink().toSliver;
              }

              return SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: QrCodeTimerWidget(
                  state.viewModel.expiresAt!,
                ).toSliver,
              );
            },
          ),
          BlocBuilder<QrCodeHistoryCubit, QrCodeHistoryState>(
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
          BlocBuilder<QrCodeHistoryCubit, QrCodeHistoryState>(
            builder: (context, state) {
              if (state.qrCodeList.isEmpty || state.qrCodeList.length == 1) {
                return const SizedBox.shrink().toSliver;
              }

              return QrCodeHistory(qrCodeList: state.qrCodeList);
            },
          )
        ],
      ),
    );
  }
}
