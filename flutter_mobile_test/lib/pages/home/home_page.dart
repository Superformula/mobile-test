import 'package:flutter/material.dart';
import 'package:flutter_mobile_test/pages/scanner/scanner_page.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      body: Center(
          child: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              child: Text(
                "Welcome to QR Code App",
                style: textTheme.headline,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
            Padding(
              child: Text(
                "Please select one of the options from the menu",
                style: textTheme.subhead,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
          ],
        ),
      )),
      floatingActionButton: _createOptionsMenu(context),
    );
  }

  _createOptionsMenu(context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      children: [
        SpeedDialChild(
          child: Icon(Icons.camera),
          backgroundColor: Colors.blue,
          onTap: () {},
          label: "QR Code",
        ),
        SpeedDialChild(
          child: Icon(Icons.camera_alt),
          backgroundColor: Colors.blue,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ScannerPage()));
          },
          label: 'Scan',
        )
      ],
    );
  }
}
