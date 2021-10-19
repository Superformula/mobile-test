import 'package:flutter/material.dart';

class AppThemeData {
  static const _lightFillColor = Color(0xFFB93C5D);

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primaryVariant
      ),
      appBarTheme: AppBarTheme(
        color: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        centerTitle: true,
        toolbarTextStyle: _textTheme.headline4
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    primaryVariant: Color(0xFFbf50c3),
    secondary: Color(0xFFEFF3F3),
    secondaryVariant: Color(0xFFFAFBFB),
    background: Color(0xfff1d9f2),
    surface: Color(0xFFFAFBFB),
    onBackground: Color(0xffbf50c3),
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    caption: TextStyle(fontFamily: 'Oswald', fontWeight: _semiBold, fontSize: 16.0),
    overline: TextStyle(fontFamily: 'Oswald', fontWeight: _medium, fontSize: 12.0),

    headline1: TextStyle(fontFamily: 'Roboto', fontSize: 40, color: const Color(0xFFbf50c3)),
    headline4: TextStyle(fontFamily: 'Roboto', fontWeight: _bold, fontSize: 20.0, color: const Color(0xFFbf50c3)),
    headline5: TextStyle(fontFamily: 'Oswald', fontWeight: _medium, fontSize: 16.0),
    headline6: TextStyle(fontFamily: 'Oswald', fontWeight: _bold, fontSize: 16.0),

    subtitle1: TextStyle(fontFamily: 'Oswald', fontWeight: _medium, fontSize: 16.0),
    subtitle2: TextStyle(fontFamily: 'Oswald', fontWeight: _medium, fontSize: 14.0),

    bodyText1: TextStyle(fontFamily: 'Oswald', fontWeight: _regular, fontSize: 14.0),
    bodyText2: TextStyle(fontFamily: 'Oswald', fontWeight: _regular, fontSize: 16.0),

    button: TextStyle(fontFamily: 'Oswald', fontWeight: _semiBold, fontSize: 14.0),
  );
}