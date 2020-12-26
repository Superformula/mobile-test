import 'dart:async';

import 'package:flutter/material.dart';

class ExpirationCountdown extends StatefulWidget {
  final DateTime expiresAt;

  const ExpirationCountdown({
    @required this.expiresAt,
    Key key,
  }) : super(key: key);

  @override
  _ExpirationCountdownState createState() => _ExpirationCountdownState();
}

class _ExpirationCountdownState extends State<ExpirationCountdown> {
  StreamController<Duration> timeLeftController = StreamController();
  static const expirationDurationInSeconds = 10;

  @override
  void initState() {
    _initTimer();
    super.initState();
  }

  void _initTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      final difference = widget.expiresAt.difference(DateTime.now());
      if (difference == Duration.zero) {
        timer.cancel();
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
      initialData: Duration(seconds: expirationDurationInSeconds),
      builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
        return Text('Expires in: ${snapshot.data.inSeconds} seconds.');
      },
    );
  }
}
