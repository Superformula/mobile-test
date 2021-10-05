import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    Key? key,
    required this.duration,
    required this.onFinish,
  }) : super(key: key);

  final Duration duration;
  final VoidCallback onFinish;

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
      duration: widget.duration,
    );
    _timerController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        widget.onFinish();
      }
    });

    super.initState();
    _timerController.reverse(from: 1);
  }

  String get _time {
    final Duration duration = _timerController.duration ?? Duration.zero;
    return (duration * _timerController.value).toString().split('.').first;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _timerController,
      builder: (_, __) => Text(_time),
    );
  }

  @override
  void dispose() {
    _timerController.dispose();
    super.dispose();
  }
}
