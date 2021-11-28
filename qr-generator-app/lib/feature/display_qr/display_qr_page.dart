import 'package:flutter/material.dart';

class DisplayQrPage extends StatelessWidget {
  const DisplayQrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display QR"),
      ),
      body: const Center(
        child: Text("display qr"),
      ),
    );

  }
}
