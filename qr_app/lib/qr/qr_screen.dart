import 'package:flutter/material.dart';

class QrScreen extends StatelessWidget {
  final String title;

  const QrScreen({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Text('qr'),
    );
  }
}
