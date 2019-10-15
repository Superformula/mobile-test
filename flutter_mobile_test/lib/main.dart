import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

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
      floatingActionButton: UnicornDialer(
        parentButtonBackground: Colors.blue,
        orientation: UnicornOrientation.VERTICAL,
        parentButton: Icon(Icons.add),
        childButtons: _createOptionsMenu(),
      ),
    );
  }

  List<UnicornButton> _createOptionsMenu() {
    final List<UnicornButton> children = [];

    children.add(_createOptionsButton(Icons.camera_alt, "Scan", () => {}));
    children.add(_createOptionsButton(Icons.pageview, "QR Code", () => {}));

    return children;
  }

  Widget _createOptionsButton(
          IconData iconData, String label, Function onPressed) =>
      UnicornButton(
        hasLabel: true,
        labelText: label,
        currentButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          mini: true,
          child: Icon(iconData),
          onPressed: onPressed,
        ),
      );
}
