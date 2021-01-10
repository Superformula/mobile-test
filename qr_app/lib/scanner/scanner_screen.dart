import 'package:flutter/material.dart';

class ScannerScreen extends StatelessWidget {
  final String title;

  const ScannerScreen({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Text('scanner'),
    );
  }
}
