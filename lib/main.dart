import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superformula_test/core/service_locator.dart';
import 'package:superformula_test/pages/home_page.dart';
import 'package:superformula_test/router/router.dart';

void main() {
  //Set Status Bar Color
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.blueGrey[700]));
  AppRoutes.createRoutes(); //create fluro routes
  ServiceLocator.register(); //Registor the locator for dependency injection
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
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.white,
        buttonColor: Colors.blueGrey[500],
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueGrey[700], brightness: Brightness.dark),
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}
