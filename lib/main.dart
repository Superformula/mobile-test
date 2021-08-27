import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superformula_test/pages/home_page.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(brightness: Brightness.dark),
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}
