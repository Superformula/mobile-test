import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
}
