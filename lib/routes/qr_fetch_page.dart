import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_test/blocs/countdown/countdown.dart';
import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';
import 'package:qr_code_test/routes/qr_fetch_page/error_widget.dart';
import 'package:qr_code_test/routes/qr_fetch_page/qr_widget.dart';

/// This route shows a QR code generated from a seed obtained via HTTP request.
class QRFetchRoute extends StatelessWidget {
  const QRFetchRoute();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code"),
      ),
      body: BlocConsumer<QRFetchBloc, QRFetchState>(
        listener: (context, state) {
          // This listener is required because, as soon as the QR seed has been
          // successfully obtained, the refresh countdown timer must start
          if (state is QRLoaded) {
            context.read<CountdownBloc>().add(CountdownStarted(
              duration: state.timeLeft
            ));
          }
        },
        builder: (context, state) {
          // Success: the seed has been obtained
          if (state is QRLoaded) {
            return QRDisplay(state.seed);
          }

          // Failure: potential connection or server error
          if (state is QRError) {
            return const QRErrorWidget(
              message: "Couldn't fetch the seed."
            );
          }

          // Default loading fallback
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}