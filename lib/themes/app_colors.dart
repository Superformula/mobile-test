import 'package:flutter/material.dart';

class AppColors {
  static Color generalBg = Color(0XFF6C60E1);

  static Color yellowAccent = Color(0xFFFFF2C7);
  static Color yellowDark = Color(0xFFFF8900);
  static Color yellowLite = Color(0xFFFFF9E7);

  static Color greenishAccent = Color(0xFFB9EEDC);
  static Color greenishDark = Color(0xFF49A687);
  static Color greenishLite = Color(0xFFE3FFF6);
}

class ButtonStyles {
  static ButtonStyle getDesign() {
     final buttonColor = AppColors.greenishDark;
    return ButtonStyle(
       
        foregroundColor: MaterialStateProperty.all<Color>(buttonColor),
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: buttonColor))));
  }
}
