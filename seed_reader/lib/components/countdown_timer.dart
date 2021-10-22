import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    Key? key,
    required Duration duration,
    VoidCallback? onFinish,
  })  : _onFinish = onFinish,
        _duration = duration < Duration.zero ? Duration.zero : duration,
        super(key: key);

  final Duration _duration;
  final VoidCallback? _onFinish;

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  late Timer _timer;
  late Duration _currentDuration;

  @override
  void initState() {
    _currentDuration = widget._duration;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_currentDuration == Duration.zero && widget._onFinish != null) {
        widget._onFinish!();
        _timer.cancel();
      }
      setState(() {
        _currentDuration = Duration(seconds: _currentDuration.inSeconds - 1);
      });
    });

    super.initState();
  }

  String get _time {
    return <String>[
      if (_currentDuration.inHours > 0)
        '${_currentDuration.inHours}'.padLeft(2, '0'),
      if (_currentDuration.inMinutes > 0)
        '${_currentDuration.inMinutes % 60}'.padLeft(2, '0'),
      if (_currentDuration.inSeconds >= 0)
        '${_currentDuration.inSeconds % 60}s'.padLeft(3, '0')
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _time,
      style: Theme.of(context).textTheme.caption,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
