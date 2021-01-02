import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_test/blocs/countdown/countdown.dart';

/// Shows a timer that goes backwards showing the hours, minutes and seconds
/// left before the refresh of the QR code
class CountdownTime extends StatelessWidget {
  const CountdownTime();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountdownBloc, CountdownState>(
      builder: (context, state) {
        // The total time left
        final time = Duration(seconds: state.totalSeconds);

        // The time is split into various units so that the text can be printed
        // easily (units at 0 won't appear).
        final hours = time.inHours.remainder(60);
        final minutes = time.inMinutes.remainder(60);
        final seconds = time.inSeconds.remainder(60);

        // Don't show hours if they're at zero
        if ((hours == 0) && (minutes != 0)) {
          return Text("Time left: $minutes min. $seconds sec.");
        }

        // Don't show minutess if they're at zero
        if ((minutes == 0) && (seconds != 0)) {
          return Text("Time left: $seconds sec.");
        }

        // Show the full time when all time units are not zero
        return Text("Time left: $hours h. $minutes min. $seconds sec.");
      },
    );
  }
}