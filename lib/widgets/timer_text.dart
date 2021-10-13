import 'package:flutter/material.dart';

class CountDownTimerText extends StatefulWidget {
  const CountDownTimerText({
    Key? key,
    required this.remainingTime,
    required this.onTimerFinish,
  }) : super(key: key);

  final int remainingTime;
  final VoidCallback onTimerFinish;

  @override
  State createState() => _CountDownTimerTextState();
}

class _CountDownTimerTextState extends State<CountDownTimerText>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Duration _duration;

  String get timerDisplayString {
    final duration = _controller.duration! * _controller.value;
    return formatTime(duration.inSeconds);
  }

  String formatTime(int seconds) {
    final hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();

    final hoursStr = (hours).toString().padLeft(2, '0');
    final minutesStr = (minutes).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return '$minutesStr:$secondsStr';
    }

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  void initState() {
    super.initState();
    _duration = Duration(seconds: widget.remainingTime);
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    );
    _controller
      ..reverse(from: widget.remainingTime.toDouble())
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          widget.onTimerFinish();
        }
      });
  }

  @override
  void didUpdateWidget(CountDownTimerText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.remainingTime != oldWidget.remainingTime) {
      setState(() {
        _duration = Duration(seconds: widget.remainingTime);
        _controller.dispose();
        _controller = AnimationController(
          vsync: this,
          duration: _duration,
        );
        _controller
          ..reverse(from: widget.remainingTime.toDouble())
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              widget.onTimerFinish();
            }
          });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) => Text(
          timerDisplayString,
          style: theme.textTheme.headline6,
        ),
      ),
    );
  }
}
