import 'package:flutter/material.dart';
import 'package:qr_app/home/home_screen.dart';
import 'package:qr_app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Routes.generateRoute,
      home: HomeScreen(title: 'Home'),
    );
  }
}
