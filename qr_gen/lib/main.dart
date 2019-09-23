import 'package:flutter/material.dart';
import 'package:qr_gen/core/locator.dart';
import 'package:qr_gen/ui/screens/home.dart';

main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QrGen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: 'Home'),
    );
  }
}
