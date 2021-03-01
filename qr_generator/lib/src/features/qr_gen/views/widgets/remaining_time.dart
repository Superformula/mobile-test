import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/qr_gen_provider.dart';

///
/// * [RemainingTime]
///
class RemainingTime extends StatefulWidget {
  /// Displays a countdown based on a given time (in seconds).
  const RemainingTime({Key key, @required this.initialTime}) : super(key: key);

  /// Starting time that's going to be counted down.
  final int initialTime;

  @override
  _RemainingTimeState createState() => _RemainingTimeState();
}

class _RemainingTimeState extends State<RemainingTime> {
  int _start;
  Timer _timer;

  void startTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    } else {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              context.read(qrGenNotifierProvider).expire();
              timer.cancel();
            } else {
              _start--;
            }
          },
        ),
      );
    }
  }

  @override
  void initState() {
    _start = widget.initialTime > 10 ? widget.initialTime : 10;
    startTimer();

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_start}s',
      style: Theme.of(context).textTheme.headline4.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
