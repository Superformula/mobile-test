import 'dart:async';

import 'package:flutter/material.dart';

//
// Timer widet displays the remaining time in seconds before the qr code expires
// 

class QrTimer extends StatefulWidget {
  final Duration duration;

  const QrTimer({Key key, this.duration}) : super(key: key);
  @override
  _QrTimerState createState() => _QrTimerState();
}

class _QrTimerState extends State<QrTimer> {
  Timer _timer;
  int _seconds;

  @override
  void initState() {
    super.initState();

    _seconds = widget.duration.inSeconds;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_timer.isActive) {
        setState(() {
          --_seconds;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_seconds <= 0) {
      _timer.cancel();
    }
    return Container(
      margin: EdgeInsets.all(8),
      child: _seconds == 0
          ? Container(
              child: Text('Qr Code has expired'),
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Time remaing: $_seconds seconds'),
            ),
    );
  }
}
