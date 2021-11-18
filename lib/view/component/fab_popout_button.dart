import 'package:flutter/material.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class PopOutFloatingActionButton extends StatelessWidget {
  const PopOutFloatingActionButton({
    Key? key,
    required this.buttonChildren,
    this.iconForClosedButton = Icons.add,
    this.closedForegroundColor = Colors.white,
    this.openForegroundColor = Colors.white,
  }) : super(key: key);

  final List<SpeedDialChild> buttonChildren;
  final IconData? iconForClosedButton;
  final Color? closedForegroundColor;
  final Color? openForegroundColor;
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      child: Icon(iconForClosedButton),
      speedDialChildren: buttonChildren,
      closedForegroundColor: Colors.white,
      openForegroundColor: Colors.white,
      closedBackgroundColor: Colors.blue,
      openBackgroundColor: Colors.black,
    );
  }
}
