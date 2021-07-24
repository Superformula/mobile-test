import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///

class CircularProgressBar extends StatelessWidget {
  final Color color;

  const CircularProgressBar({
    Key? key,
    this.color = Colors.blueAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}
