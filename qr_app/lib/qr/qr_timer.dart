import 'dart:async';

import 'package:flutter/material.dart';

class QrTimer extends StatefulWidget {
  final Duration duration;

  const QrTimer({Key key, this.duration}) : super(key: key);
  @override
  _QrTimerState createState() => _QrTimerState();
}

class _QrTimerState extends State<QrTimer> {
  Timer timer;
  int seconds;

  @override
  void initState() {
    super.initState();

    seconds = widget.duration.inSeconds;
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (timer.isActive) {
        setState(() {
          --seconds;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (seconds <= 0) {
      timer.cancel();
    }
    return Container(
      margin: EdgeInsets.all(8),
      child: seconds == 0
          ? Container(
              child: Text('Qr Code has expired'),
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Time remaing: $seconds seconds'),
            ),
    );
  }
}
