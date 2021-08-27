import 'package:flutter/material.dart';

class QrCodePage extends StatefulWidget {
  QrCodePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QrCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          widget.title ?? '',
          style: TextStyle(color: Colors.green[700]),
        )),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'QR Page',
            ),
          ],
        ),
      ),
    );
  }
}
