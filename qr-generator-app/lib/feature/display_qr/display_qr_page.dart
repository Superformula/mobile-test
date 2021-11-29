import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_app/feature/display_qr/display_qr_state_notifier.dart';
import 'package:qr_generator_app/model/qr_data.dart';

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
                  initial: () => _buildDisplayQrButton(() => ref
                      .read(displayQrStateNotifierProvider.notifier)
                      .getSeed()),
                  loading: () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox.square(
                        dimension: 24.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: _buildDisplayQrButton(null),
                      ),
                      const SizedBox.square(
                        dimension: 24.0,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                  success: (QrData qrData) => QrDataWidget(qrData: qrData),
                  error: (String? error) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("an error occurred, press to retry."),
                      IconButton(
                          onPressed: () => ref
                              .read(displayQrStateNotifierProvider.notifier)
                              .getSeed(),
                          icon: const Icon(Icons.restart_alt_rounded))
                    ],
                  ),
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

class QrDataWidget extends StatefulWidget {
  final QrData qrData;

  const QrDataWidget({Key? key, required this.qrData}) : super(key: key);

  @override
  State<QrDataWidget> createState() => _QrDataWidgetState();
}

class _QrDataWidgetState extends State<QrDataWidget> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      Duration difference = widget.qrData.expiresAt.difference(DateTime.now());

      if (difference.isNegative) {
        timer.cancel();
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    int secondsRemaining =
        widget.qrData.expiresAt.difference(DateTime.now()).inSeconds;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          QrImage(
            data: widget.qrData.seed,
            size: 256.0,
          ),
          secondsRemaining > 0
              ? Text("${secondsRemaining}s...")
              : Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return ElevatedButton.icon(
                      onPressed: () => ref
                          .read(displayQrStateNotifierProvider.notifier)
                          .getSeed(),
                      icon: const Icon(Icons.cloud_download_outlined),
                      label: const Text("display qr"),
                    );
                  },
                )
        ],
      ),
    );
  }
}
