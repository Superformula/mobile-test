import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);
  TextTheme get textTheme => themeData.textTheme;
}

extension SizeExtension on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}

extension SliverExtension on Widget {
  Widget get toSliver => SliverToBoxAdapter(child: this);
}

extension DateFormatExtension on DateTime {
  String get toMMddYYYYHHmm {
    return '${month.timePadLeft}/$day/$year - ${hour.timePadLeft}:${minute.timePadLeft}';
  }
}

extension TimePadLeftExtension on int {
  String get timePadLeft => toString().padLeft(2, '0');
}
