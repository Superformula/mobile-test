import 'dart:async';

import 'package:flutter/material.dart';

class ExpirationCountdown extends StatefulWidget {
  final DateTime expiresAt;
  final VoidCallback onExpiration;

  const ExpirationCountdown({
    @required this.expiresAt,
    this.onExpiration,
    Key key,
  }) : super(key: key);

  @override
  _ExpirationCountdownState createState() => _ExpirationCountdownState();
}

class _ExpirationCountdownState extends State<ExpirationCountdown> {
  StreamController<Duration> timeLeftController = StreamController();
  static const expirationDurationInSeconds = 10;
  Timer _timer;

  @override
  void initState() {
    _initTimer();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ExpirationCountdown oldWidget) {
    if (oldWidget.expiresAt != widget.expiresAt) {
      _initTimer();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _initTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final difference = widget.expiresAt.difference(DateTime.now());
      if (difference <= Duration.zero) {
        timer.cancel();
        widget.onExpiration?.call();
        return;
      }

      if (mounted) {
        timeLeftController.add(difference);
      }
    });
  }

  @override
  void dispose() {
    timeLeftController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: timeLeftController.stream,
      initialData: Duration(seconds: expirationDurationInSeconds - 1),
      builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
        return Text('Expires in: ${snapshot.data.inSeconds} seconds.');
      },
    );
  }
}
