import 'dart:async';

import 'package:flutter/material.dart';

import 'package:mobile_test/api/seed_api.dart' as seed_api;
import 'package:mobile_test/dataClasses/seed_response.dart';
import 'package:mobile_test/ui/components/messages.dart';
import 'package:mobile_test/ui/components/standard_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// The Barcode class represents the QR Code display page. It uses a
/// StandardPage object and shows a _BarcodeView which provides the content.
class Barcode extends StatelessWidget {
  const Barcode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardPage(body: _BarcodeView(), title: 'QR Code');
  }
}

/// The _BarcodeView uses a FutureBuild to call the seed_api.getSeed function to
/// retrieve a random seed. While search, a progress indicator is shown. If an
/// error occurs, an error message is shown. Finally, if a seed is retrieved,
/// a QR Code is rendered for the user to view. Currently, a generic message is
/// shown, but a more robust solution would be to show different errors messages
/// depending on the errors.
class _BarcodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SeedResponse>(
      future: seed_api.getSeed(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        var seedResponse = snapshot.data;

        if (snapshot.hasError || seedResponse == null) {
          // TODO Show better error messages communicating the actual problem

          // show error message
          return ErrorMessage('${snapshot.error}');
        }

        // show QR Code
        return _QRCode(seedResponse);
      },
    );
  }
}

/// _QRCode class represents the actual QR Code widget. A Text widget also shows
/// the text representation of the seed.
class _QRCode extends StatelessWidget {
  final SeedResponse seedResponse;

  const _QRCode(this.seedResponse);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        QrImage(
          data: seedResponse.seed,
        ),
        Text(
          seedResponse.seed,
          textAlign: TextAlign.center,
        ),
        _QRCodeTimer(seedResponse.expiration)
      ],
    );
  }
}

/// The _QRCodeTimer class shows a count down timer for the quantity of seconds
/// remaining for the QR Code's validity. A Stateless Widget is used to keep
/// track of the expiration and previous time so that while counting down, the
/// widget can determine if needs to refresh the widget any longer.
class _QRCodeTimer extends StatefulWidget {
  final DateTime timeout;

  const _QRCodeTimer(this.timeout);

  @override
  _QRCodeTimerState createState() => _QRCodeTimerState();
}

class _QRCodeTimerState extends State<_QRCodeTimer> {
  DateTime prevTime;

  /// On the onset, we run setTimer to star the timer process
  _QRCodeTimerState() : prevTime = DateTime.now() {
    setTimer(const Duration(seconds: 1));
  }

  /// isExpired tells the user if the timer has expired.
  bool get isExpired {
    var now = DateTime.now();
    return now.isAfter(widget.timeout);
  }

  /// timeLeft displays a string that either gives the expiration in seconds or
  /// says "Expired" when the code expires.
  String get timeLeft {
    if (isExpired) {
      return 'Expired';
    }

    var now = DateTime.now();
    var dif = widget.timeout.difference(now);
    return 'Expiration: ${dif.inSeconds}';
  }

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontSize: 20,
    );

    // We maintain consistency with font size, but change the color depending on
    // whether the code is expired or not.
    if (isExpired) {
      style = style.copyWith(color: Colors.red);
    }

    return Text(
      timeLeft,
      style: style,
    );
  }

  /// Sets a timer that will wait 1 second, then use setState to change the
  /// prevTimer value. The prevTimer value is used to determine just how long
  /// has passed since the last time this function was called. Setting state
  /// will cause the widget to re-render and display the new time.
  resetTimer() {
    final now = DateTime.now();
    // Step 1: Determine if we have exceeded the timeout period.
    if (now.isAfter(widget.timeout)) {
      // Do nothing
      return;
    }

    // Step 2: just set the timer to 1 second later.
    setTimer(const Duration(seconds: 1));
  }

  /// setTimer just creates a new Timer to run reset timer again.
  setTimer(Duration duration) {
    Timer(duration, () {
      setState(() {
        prevTime = DateTime.now();
      });
      resetTimer();
    });
  }
}
