import 'package:flutter/material.dart';
import 'package:massula_test/resources/string_constant.dart';

class SecondsCountDown extends StatefulWidget {
  final VoidCallback onEnd;
  final int seconds;

  const SecondsCountDown({
    Key? key,
    required this.seconds,
    required this.onEnd
  }) : super(key: key);

  @override
  _SecondsCountDownState createState() => _SecondsCountDownState();
}

class _SecondsCountDownState extends State<SecondsCountDown> {
  late int currentSecondsLeft;

  @override
  void initState() {
    currentSecondsLeft = widget.seconds;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    rebuildInASecond();
    return Text('$currentSecondsLeft ${StringConstant.SECONDS_LEFT_LABEL}');
  }

  void rebuildInASecond() async {
    if(currentSecondsLeft > 0) {
      await Future.delayed(Duration(seconds: 1));
      if(this.mounted) {
        setState(() => currentSecondsLeft-- );
      }
    } else {
      widget.onEnd();
    }
  }
}