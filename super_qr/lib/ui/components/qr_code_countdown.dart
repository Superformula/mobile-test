import 'dart:async';

import 'package:flutter/material.dart';

/// Widget that renders the seconds left before the current Seeds expiration.
class QRDisplayCountdown extends StatefulWidget {
  final DateTime seedExpiresAt;

  const QRDisplayCountdown({Key key, this.seedExpiresAt}) : super(key: key);

  @override
  _QRDisplayCountdownState createState() => _QRDisplayCountdownState();
}

class _QRDisplayCountdownState extends State<QRDisplayCountdown> {
  Timer _ticker;
  int _secondsLeft;

  @override
  void initState() {
    super.initState();

    // Set initial value
    _secondsLeft = getDifference().inSeconds;

    // Update the time left display every second
    _ticker = Timer.periodic(Duration(seconds: 1), (Timer t) {
      updateTime();
    });
  }

  // Get the current difference between now and the seed's expiration
  Duration getDifference() {
    Duration difference = widget.seedExpiresAt.difference(DateTime.now());
    return difference;
  }

  @override
  void dispose() {
    _ticker.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Text(
      '${_secondsLeft}s',
      style: textTheme.display1,
    );
  }

  void updateTime() {
    setState(() {
      _secondsLeft = getDifference().inSeconds;
    });
  }
}
