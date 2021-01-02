import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';
import 'package:qr_code_test/routes/home_page/icon_and_text.dart';

/// A widget showing an error message and an icon on top of it. It also provides
/// a 'Retry' button to try the failed action again.
class QRErrorWidget extends StatelessWidget {
  /// The error message to be displayed
  final String message;

  /// A widget that shows an error [message].
  const QRErrorWidget({
    this.message = "Something went wrong!"
  });

  /// Tries to fetch the QR code again from the HTTP server
  void _retryFetch(BuildContext context) {
    // Emit the event
    context.read<QRFetchBloc>().add(const FetchNewQR());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // The error icon
          const Icon(Icons.error,
            color: Colors.red,
            size: 50,
          ),

          // Spacer
          const SizedBox(
            height: 20,
          ),

          // The error message
          Text(message,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),

          // Spacing needed for a Divider to not be too close to the button and
          // the text
          const Padding(
            padding: EdgeInsets.all(30),
            child: Divider(
              thickness: 2,
            ),
          ),

          // 'Retry' button
          RaisedButton(
            child: const IconAndText(
              icon: Icon(Icons.autorenew,
                color: Colors.white,
              ),
              text: "Retry",
            ),
            onPressed: () => _retryFetch(context),
          ),
        ],
      ),
    );
  }
}