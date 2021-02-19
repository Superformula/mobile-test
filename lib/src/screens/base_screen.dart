import 'package:flutter/material.dart';

class BaseScreenScaffold extends StatefulWidget {
  const BaseScreenScaffold({Key key, this.title = 'HOME', this.body})
      : super(key: key);
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
          centerTitle: true,
          title: Padding(
              padding: EdgeInsets.only(
                  right: widget.title.contains('HOME') ? 0 : 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.title,
                  ),
                ],
              )),
        ),
        body: widget.body);
  }
}
