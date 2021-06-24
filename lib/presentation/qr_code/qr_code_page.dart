import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator/application/qr_page/qr_page_cubit.dart';
import 'package:qr_generator/injection.dart';

class QRCodePage extends StatelessWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => locator<QrPageCubit>()..loadQr(),
          child: const QrWidget(),
        ),
      ),
    );
  }
}

class QrWidget extends StatelessWidget {
  const QrWidget({Key? key}) : super(key: key);

  String _printDuration(DateTime expiresAt) {
    final now = DateTime.now();
    final ttl =
        (expiresAt.millisecondsSinceEpoch - now.millisecondsSinceEpoch) ~/ 1000;
    return "$ttl seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<QrPageCubit, QrPageState>(
        builder: (context, state) {
          return state.map(
              loading: (_) => const CircularProgressIndicator(),
              loaded: (loadedState) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      QrImage(
                        data: loadedState.seed.seed,
                        size: MediaQuery.of(context).size.width / 2,
                      ),
                      const SizedBox(height: 12),
                      Text(_printDuration(loadedState.seed.expiresAt))
                      // Text(DateFormat.ms().format(loadedState.seed.expiresAt))
                    ],
                  ),
              loadError: (errorState) {
                return Text(
                  errorState.failure.map(
                      noInternet: (_) => 'Error, No internet connection',
                      unknown: (_) => 'An unknown error ocurred'),
                );
              });
        },
      ),
    );
  }
}
