import 'package:flutter/material.dart';

class QRCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Super Scanner')
      ),
      body: Center(
        child: Column(
          children: [
            Text('Tap the "+" to get started!')
          ],
        )
      )
    );
  }

}