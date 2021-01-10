import 'package:flutter/material.dart';

class AppTheme {

  static final dark = ThemeData(
    accentColorBrightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        color: Colors.black, brightness: Brightness.dark, elevation: 0.8),
    iconTheme: IconThemeData(color: Colors.white),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.black54,
    dividerColor: Colors.transparent,
    accentColor: Colors.blueAccent,
    primaryColor: Colors.white,
    primaryColorLight: Colors.white,
    cursorColor: Colors.white,
    fontFamily: 'Montserrat',
    hintColor: Colors.white,
  );

  static final light = ThemeData(
    appBarTheme: AppBarTheme(
        color: Colors.white, brightness: Brightness.light),
    iconTheme: IconThemeData(color: Colors.black),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    dividerColor: Colors.grey,
    accentColorBrightness: Brightness.light,
    accentColor: Colors.blueAccent,
    primaryColor: Colors.black,
    primaryColorLight: Colors.black,
    cursorColor: Colors.black,
    fontFamily: 'Montserrat',
    hintColor: Colors.black,
  );
}
