import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './styling.dart';

ThemeData principalLightTheme(BuildContext context) {
  final base = ThemeData.light();

  return ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
      constraints: BoxConstraints.tightFor(width: 450),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Color(0xff005697),
    selectedRowColor: Colors.blue.shade600,
    inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),
    scaffoldBackgroundColor: Styling.scaffold,
    buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue.shade600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        textTheme: ButtonTextTheme.primary),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      color: Styling.nearlyWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.black, backgroundColor: Colors.yellow.shade600),
    tabBarTheme: TabBarTheme(labelColor: Colors.black),
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        color: Colors.green,
        elevation: 3,
        iconTheme: IconTheme.of(context).copyWith(color: Colors.white),
        centerTitle: false),
    snackBarTheme: base.snackBarTheme.copyWith(
      behavior: SnackBarBehavior.fixed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    textTheme: Styling.textTheme,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.blue.shade200,
      selectionHandleColor: Colors.grey.shade200,
    ),
  );
}
