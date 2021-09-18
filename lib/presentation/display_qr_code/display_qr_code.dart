import 'package:flutter/material.dart';

class DisplayQrCodeScreen extends StatelessWidget {
  const DisplayQrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Display Qr Code'),
      ),
      body: const Center(
        child: Text('Display Qr Code Screen'),
      ),
    );
  }
}
