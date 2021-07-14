import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matheus Massula Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}