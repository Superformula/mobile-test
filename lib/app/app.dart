import 'package:flutter/material.dart';
import 'package:mobile_test/app/dependencies.dart';
import 'package:mobile_test/home/home_screen.dart';

class SuperformulaApp extends StatelessWidget {
  SuperformulaApp({Key? key}) : super(key: key);

  final mainColor = getIt.get<Color>(instanceName: 'mainColor');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: mainColor,
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: mainColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
