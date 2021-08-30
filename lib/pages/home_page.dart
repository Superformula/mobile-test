import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:superformula_test/router/router.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title = 'Home'}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? updatedText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            widget.title,
            style: TextStyle(color: Theme.of(context).accentColor),
          )),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                //This text is updated on a callback from the previous page to show arguments
                //passing through a route on pop()
                updatedText != null ? updatedText!.toUpperCase() : 'SUPERFORMULA TEST',
              ),
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
          overlayOpacity: 0,
          backgroundColor: Theme.of(context).buttonColor,
          activeChild: Icon(
            Icons.close,
            color: Theme.of(context).accentColor,
          ),
          child: Icon(
            Icons.add,
            color: Theme.of(context).accentColor,
          ),
          children: [
            SpeedDialChild(
                backgroundColor: Theme.of(context).buttonColor,
                child: Icon(
                  Icons.qr_code,
                  color: Theme.of(context).accentColor,
                ),
                label: 'QR Code',
                onTap: () {
                  //Navigator Route
                  AppRoutes.navigate(context, '/qrcode', args: 'QR Code');
                }),
            SpeedDialChild(
                backgroundColor: Theme.of(context).buttonColor,
                child: Icon(
                  Icons.qr_code_scanner,
                  color: Theme.of(context).accentColor,
                ),
                label: 'QR Scanner',
                onTap: () {
                  //Navigator Route
                  AppRoutes.navigate(context, '/qrscanner',
                          args: 'Scan QR Code')
                      .then((value) {
                        //This is where the text is recived from the previous route and updated on the page.
                    setState(() => updatedText = value);
                  });
                })
          ],
        ));
  }
}
