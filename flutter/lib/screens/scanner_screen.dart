import 'package:flutter/material.dart';

class ScannerScreen extends StatefulWidget {

  static const routeName = "/scanner_screen";
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner"),
      ),
    );
  }
}
