import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScanQrCodeScreen extends StatelessWidget {
  const ScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Scan Qr Code'),
      ),
      body: const Center(
        child: Text('Scan Qr Code Screen'),
      ),
    );
  }
}
