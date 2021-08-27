import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superformula_test/pages/home_page.dart';
import 'package:superformula_test/router/router.dart';

void main() {
  AppRoutes.createRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(brightness: Brightness.dark),
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}
