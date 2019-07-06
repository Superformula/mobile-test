import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImage(
              data: '123456',
              size: 200.0,
              foregroundColor: Colors.grey[900],
            ),
            Text('TODO: expires in...'),
          ],
        ),
      ),
    );
  }
}
