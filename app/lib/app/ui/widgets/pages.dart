import 'package:flutter/material.dart';

///
/// PageMixin to ensure all pages have a scaffold and safe area.
///
mixin PageMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget buildPage(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Container(
          child: buildBody(context),
        ),
      ),
      endDrawer: buildEndDrawer(context),
      floatingActionButton: buildFab(context),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return null;
  }

  Widget buildBody(BuildContext context) {
    return null;
  }

  Widget buildEndDrawer(BuildContext context) {
    return null;
  }

  Widget buildFab(BuildContext context) {
    return null;
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return null;
  }

  void showSnackBar(
    String message, {
    String prompt,
    Duration duration = const Duration(seconds: 4),
    VoidCallback onPressed,
  }) {
    _scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        action: onPressed != null ? SnackBarAction(label: prompt, onPressed: onPressed) : null,
        duration: duration,
      ),
    );
  }
}

///
/// Base class for stateless pages.
///
abstract class StatelessPage extends StatelessWidget with PageMixin {
  StatelessPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildPage(context);
  }
}

///
/// Base class for stateful pages.
///
abstract class StatefulPage extends StatefulWidget {
  StatefulPage({Key key}) : super(key: key);
}

///
/// Base class for page state uses with stateful pages.
///
abstract class PageState<T extends StatefulPage> extends State<T> with PageMixin {
  @override
  Widget build(BuildContext context) {
    return buildPage(context);
  }
}
S