import 'package:flutter/material.dart';

import 'package:sftest_flutter/screens/qrcode_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _goToQRScreen() {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) {
          return new QRCodeScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Select a screen.",
            ), 
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToQRScreen,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
