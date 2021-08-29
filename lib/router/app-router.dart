import 'package:flutter/material.dart';
import 'package:qr_generator/router/app-route-table.dart';

class AppRouter {

  final AppRouteTable _routeTable;

  AppRouter(this._routeTable);

  MaterialPageRoute route(RouteSettings settings) {
    Map<String, dynamic>? args;
    if(settings.arguments != null) {
      args = settings.arguments as Map<String, dynamic>;
    }

    WidgetBuilder? routedWidget = _routeTable.getRoute(settings.name, args);
    if(routedWidget != null) {
      return MaterialPageRoute(
        settings: RouteSettings(name: settings.name),
        builder: routedWidget 
      );
    } else {
      throw Exception("${settings.name} is not a valid route");
    }
  }
}