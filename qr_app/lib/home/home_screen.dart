import 'package:flutter/material.dart';
import 'package:qr_app/routes.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.Scan,
                      arguments: {'title': 'Scan'});
                },
                icon: Icon(Icons.qr_code_scanner),
                label: Text('Scan')),
            FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.Qr,
                      arguments: {'title': 'QR Code'});
                },
                icon: Icon(Icons.qr_code),
                label: Text('QRCode')),
          ],
        ),
      ),
    );
  }
}
