import 'package:flutter/material.dart';
import 'package:super_qr/utils/constants.dart';

class QRDisplayView extends StatefulWidget {
  @override
  _QRDisplayViewState createState() => _QRDisplayViewState();
}

class _QRDisplayViewState extends State<QRDisplayView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          VIEW_A_QR_CODE_PAGE_TITLE,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [Text('TODO: Display a QR Code!')],
        ),
      ),
    );
  }
}
