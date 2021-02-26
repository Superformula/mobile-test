import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/src/core/styles/app_text_styles.dart';

///Expiration timer widget
class ExpirationTimer extends StatefulWidget {
  ///Widget that set a timer with a `callback`
  ExpirationTimer({
    Key key,
    @required this.expirationDate,
    @required this.onExpiration,
  }) : super(key: key);

  ///Expiration of timer
  final DateTime expirationDate;

  ///Callback to be called on timer end
  final VoidCallback onExpiration;

  @override
  _ExpirationTimerState createState() => _ExpirationTimerState();
}

class _ExpirationTimerState extends State<ExpirationTimer> {
  int _counter;
  Timer _timer;

  void _startTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (mounted) {
          setState(() {
            if (_counter > 0) {
              _counter--;
            } else {
              _timer.cancel();
              widget.onExpiration();
            }
          });
        }
      },
    );
  }

  @override
  void initState() {
    _counter = widget.expirationDate.difference(DateTime.now()).inSeconds;
    _startTimer();
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
      '$_counter',
      style: AppTextStyle.timer,
    );
  }
}
