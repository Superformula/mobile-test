import 'package:flutter/material.dart';

class BaseScreenScaffold extends StatefulWidget {
  BaseScreenScaffold({Key key, this.title, this.body}) : super(key: key);
  final String title;
  final Widget body;

  @override
  _BaseScreenScaffoldState createState() => _BaseScreenScaffoldState();
}

class _BaseScreenScaffoldState extends State<BaseScreenScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.title,
        )),
      ),
      body: widget.body,
    );
  }
}
