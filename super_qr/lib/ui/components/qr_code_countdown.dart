import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_qr/utils/utils.dart';

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
    _secondsLeft = getDifferenceFromNow(widget.seedExpiresAt).inSeconds;

    // Update the time left display every second
    _ticker = Timer.periodic(Duration(seconds: 1), (Timer t) {
      updateTime();
    });
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
      _secondsLeft = getDifferenceFromNow(widget.seedExpiresAt).inSeconds;
    });
  }
}
