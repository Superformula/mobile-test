import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    Key? key,
    required this.duration,
    this.onFinish,
  }) : super(key: key);

  final Duration duration;
  final VoidCallback? onFinish;

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  late AnimationController _timerController;

  @override
  void initState() {
    _timerController = AnimationController(
      vsync: this,
      duration:
          widget.duration < Duration.zero ? Duration.zero : widget.duration,
    );
    _timerController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        if (widget.onFinish != null) {
          widget.onFinish!();
        }
      }
    });

    super.initState();
    _timerController.reverse(from: 1);
  }

  String get _time {
    final Duration totalDuration = _timerController.duration ?? Duration.zero;
    final Duration currentDuration = totalDuration * _timerController.value;

    return <String>[
      if (currentDuration.inHours > 0)
        '${currentDuration.inHours}'.padLeft(2, '0'),
      if (currentDuration.inMinutes > 0)
        '${currentDuration.inMinutes % 60}'.padLeft(2, '0'),
      if (currentDuration.inSeconds >= 0)
        '${currentDuration.inSeconds % 60}s'.padLeft(3, '0')
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _timerController,
      builder: (_, __) => Text(
        _time,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }

  @override
  void dispose() {
    _timerController.dispose();
    super.dispose();
  }
}
