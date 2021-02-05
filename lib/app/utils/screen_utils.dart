import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenUtils {
  /// The device's screen width in physical pixels
  static double width(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size
        .width;
    return size;
  }

  /// The device's screen height in physical pixels
  static double height(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size
        .height;
    return size;
  }
}
