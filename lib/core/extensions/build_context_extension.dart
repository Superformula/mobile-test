import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  TextTheme get textTheme => Theme.of(this).textTheme;
  Color get primaryColor => Theme.of(this).primaryColor;
}
