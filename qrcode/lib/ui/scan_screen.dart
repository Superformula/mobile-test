import 'package:flutter/material.dart';

///
/// Screen used to scan QRCodes
///
class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan"),),
      body: Text("hello"),
    );
  }
}