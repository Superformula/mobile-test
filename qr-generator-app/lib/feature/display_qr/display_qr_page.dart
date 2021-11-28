import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_generator_app/feature/display_qr/display_qr_state_notifier.dart';

class DisplayQrPage extends StatelessWidget {
  const DisplayQrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display QR"),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Center(
            child: ref.watch(displayQrStateNotifierProvider).when(
                  initial: () => _buildDisplayQrButton(() {}),
                  loading: () => const Text("loading"),
                  success: (String seed) => const Text("success"),
                  error: (String? error) => const Text("error"),
                ),
          );
        },
      ),
    );
  }

  _buildDisplayQrButton(VoidCallback? action) => ElevatedButton.icon(
        onPressed: action != null ? () => action.call() : null,
        icon: const Icon(Icons.cloud_download_outlined),
        label: const Text("display qr"),
      );
}
