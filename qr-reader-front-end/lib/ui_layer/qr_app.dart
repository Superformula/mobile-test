import 'package:flutter/material.dart';
import 'package:superformula/ui_layer/home_page.dart';
import 'package:superformula/ui_layer/qr_generating_page.dart';
import 'package:superformula/ui_layer/scaning_page.dart';

class QRApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(color: Colors.deepPurple),
        primarySwatch: Colors.purple,
        brightness: Brightness.dark,
      ),
      home: HomePage(),
      routes: {
        ScanningPage.route: (context) => ScanningPage(),
        QrGeneratingPage.route: (context) => QrGeneratingPage(),
      },
    );
  }
}
