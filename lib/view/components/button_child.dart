import 'package:flutter/material.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class ButtonChild extends SpeedDialChild {
  final Icon icon;
  final Function pressed;
  final String text;
  ButtonChild({required this.icon, required this.pressed, required this.text})
      : super(label: text, child: icon, onPressed: pressed);

  SpeedDialChild build(BuildContext context) {
    return SpeedDialChild(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      label: text,
    );
  }
}
