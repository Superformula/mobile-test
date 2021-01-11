import 'package:flutter/material.dart';
import 'package:qr_app/routes.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showMenu = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _showMenu = !_showMenu;
              });
            }),
        body: Stack(
          children: [
            Container(),
            AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                bottom: _showMenu ? 100 : -150,
                right: 8,
                width: 120,
                child: Container(
                    child: Column(children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.Scan,
                          arguments: {'title': 'Scan'});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Scan"),
                        Icon(Icons.qr_code_scanner_sharp),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.Qr,
                          arguments: {'title': 'QR Code'});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("QRCode"),
                        Icon(Icons.qr_code_sharp),
                      ],
                    ),
                  )
                ])))
          ],
        ));
  }
}
