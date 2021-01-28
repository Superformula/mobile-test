import 'package:flutter/widgets.dart';

class Countdown extends StatelessWidget {
  const Countdown({
    Key key,
    this.remainingTime,
  }) : super(key: key);

  final Duration remainingTime;

  @override
  Widget build(BuildContext context) {
    var hours = (remainingTime.inHours > 0
        ? remainingTime.inHours.toString().padLeft(2, '0') + ':'
        : '');

    var minutes = (remainingTime.inMinutes % 60).toString().padLeft(2, '0');

    var seconds = (remainingTime.inSeconds % 60).toString().padLeft(2, '0');

    return Text(
      hours + minutes + ':' + seconds,
      style: TextStyle(
        fontSize: 40,
      ),
    );
  }
}
