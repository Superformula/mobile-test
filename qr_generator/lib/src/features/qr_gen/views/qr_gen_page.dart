import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/auto_refresh_provider.dart';
import '../logic/qr_gen_provider.dart';

import 'qr_gen_page.i18n.dart';
import 'widgets/widgets.dart';

///
/// * [QRCodeGeneratorPage]
///
class QRCodeGeneratorPage extends StatelessWidget {
  /// Shows the QR code states based on the existence of a seed.
  const QRCodeGeneratorPage({Key key}) : super(key: key);

  /// Static method to return the widget as a PageRoute
  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => const QRCodeGeneratorPage());
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read(qrGenNotifierProvider).reset(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(kQRCodeMessage.i18n),
        actions: [const _AutoRefreshConsumer()],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Align(child: _QRGenerationConsumer()),
          const Align(child: _RemainingTimeConsumer()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.qr_code_rounded),
        onPressed: context.read(qrGenNotifierProvider).getSeed,
      ),
    );
  }
}

// This widget listens to changes in the autoRefresh state
// and also can set a new state to [autoRefreshProvider].
class _AutoRefreshConsumer extends ConsumerWidget {
  const _AutoRefreshConsumer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final autoRefresh = watch(autoRefreshProvider).state;

    return IconButton(
      icon: Icon(autoRefresh ? Icons.close : Icons.refresh),
      onPressed: () => context.read(autoRefreshProvider).state = !autoRefresh,
    );
  }
}

// This widget is listening to every QR code  to notify
// the [RemainingTime] widget which is the next expire time.
class _RemainingTimeConsumer extends ConsumerWidget {
  const _RemainingTimeConsumer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(qrGenNotifierProvider.state);

    return state.maybeWhen(
      code: (_, expires) => RemainingTime(initialTime: expires.minute),
      orElse: () => const SizedBox.shrink(),
    );
  }
}

class _QRGenerationConsumer extends ConsumerWidget {
  const _QRGenerationConsumer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final autoRefresh = watch(autoRefreshProvider).state;
    final state = watch(qrGenNotifierProvider.state);

    return state.when(
      code: (code, _) => QRCode(qrPainter: code),
      initial: () => Message(label: kPressButtonMessage.i18n),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_) => Message(label: kSomethingWentWrongMessage.i18n),
      expired: () {
        // Check if auto refresh is enabled.
        // If it is, get a new seed every time a code expires.
        if (autoRefresh) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read(qrGenNotifierProvider).getSeed();
          });
        }

        return Message(label: kQRCodeExpiredMessage.i18n);
      },
    );
  }
}
