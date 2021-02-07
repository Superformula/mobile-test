import 'package:flutter/material.dart';
import 'package:qr_app/route_names.dart';

import 'routes.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteNames.Home.route,
      routes: routes,
    );
  }
}
