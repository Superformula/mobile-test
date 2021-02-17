import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({Key key, @required this.endTime}) : super(key: key);

  final int endTime;

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  CountdownTimerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CountdownTimerController(endTime: widget.endTime + 1000); // We add one second so it counts down to 1, instead of zero
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      controller: _controller,
      widgetBuilder: (_, time) {
        if (time == null) {
          return Container();
        }
        final value = time.inSeconds();
        final unit = value == 1 ? 'second' : 'seconds';
        return Text('$value $unit');
      },
    );
  }
}

extension _HelperExtension on CurrentRemainingTime {
  int inSeconds() {
    var result = sec;
    if (min != null) {
      result += min * 60;
    }
    if (hours != null) {
      result += hours * 3600;
    }
    if (days != null) {
      result += days * 86400;
    }
    return result;
  }
}
