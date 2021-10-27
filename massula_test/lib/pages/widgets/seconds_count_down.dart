import 'package:flutter/material.dart';
import 'package:massula_test/resources/string_constant.dart';

class SecondsCountDown extends StatelessWidget {
  final VoidCallback onEnd;
  final int seconds;

  const SecondsCountDown({
    Key? key,
    required this.seconds,
    required this.onEnd
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<double>(
    tween: Tween(begin: seconds.toDouble(), end: 0.0),
    duration: Duration(seconds: seconds),
    builder: (context, value, child) => Text('${value.toInt()} ${StringConstant.SECONDS_LEFT_LABEL}'),
    onEnd: () => onEnd(),
  );
}