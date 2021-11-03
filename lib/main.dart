import 'package:flutter/material.dart';

import 'package:mobile_test/ui/pages/home.dart';

void main() {
  runApp(const MyApp());
}

/// The MyApp class is short and sweet. I tend to use main.dart as a place to
/// bootstrap the application. That includes any initialization functions that
/// are required for the app to run (e.g persistence data stores) and any
/// temporary UI widgets prior to the app proper running. In this case, we are
/// using MyApp just to set up the MaterialApp Widget before display the Home
/// widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
