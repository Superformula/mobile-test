import 'package:flutter/material.dart';
import 'package:qr_app/data/models/qr_model.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/qr/qr_timer.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatelessWidget {
  final String title;

  const QrScreen({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    QrModel qrModel = Provider.of<QrModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
              flex: 4,
              child: Center(
                  child: QrImage(
                data: 'This is a simple QR code',
                version: QrVersions.auto,
                size: 320,
                gapless: false,
              ))),
          Expanded(
              flex: 1,
              child: QrTimer(
                duration: Duration(seconds: 10),
              ))
        ],
      )),
    );
  }
}
