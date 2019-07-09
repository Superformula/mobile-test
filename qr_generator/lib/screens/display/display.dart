import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_generator/models/seed.dart';
import 'package:qr_generator/screens/display/widgets/countdown.dart';
import 'package:qr_generator/screens/display/widgets/qr_code.dart';

class DisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var seed = Provider.of<Seed>(context);
    var timeout =
        seed.busy ? null : seed.expiresAt.difference(DateTime.now()).inSeconds;

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
        child: seed.busy
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  QrCode(),
                  Countdown(timeout),
                ],
              ),
      ),
    );
  }
}
