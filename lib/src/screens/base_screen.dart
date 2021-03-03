import 'package:flutter/material.dart';

class BaseScreenScaffold extends StatefulWidget {
  const BaseScreenScaffold(
      {Key key, this.title = 'HOME', this.body, this.floatingButton})
      : super(key: key);
  final String title;
  final Widget body;
  final Widget floatingButton;

  @override
  _BaseScreenScaffoldState createState() => _BaseScreenScaffoldState();
}

class _BaseScreenScaffoldState extends State<BaseScreenScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
            ),
          ],
        ),
      ),
      body: widget.body == null ? Container() : widget.body,
      floatingActionButton:
          widget.floatingButton != null ? widget.floatingButton : Container(),
    );
  }
}
