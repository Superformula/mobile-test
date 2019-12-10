import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef Widget BuildHomePage();

class RootRouterPage extends StatefulWidget {
  final BuildHomePage buildHomePage;

  const RootRouterPage({
    Key key,
    @required this.buildHomePage,
  }) : super(key: key);

  @override
  _RootRouterPageState createState() => _RootRouterPageState();
}

class _RootRouterPageState extends State<RootRouterPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => widget.buildHomePage(),
            );
          default:
            return throw "No Route found for route name.";
        }
      },
    );
  }
}
