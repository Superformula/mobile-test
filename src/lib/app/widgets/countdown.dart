import 'package:flutter/widgets.dart';

class Countdown extends StatelessWidget {
  const Countdown({
    Key key,
    this.remainingTime,
  }) : super(key: key);

  final Duration remainingTime;

  @override
  Widget build(BuildContext context) {
    return Text(remainingTime.toString().split('.')[0]);
  }
}
