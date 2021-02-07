import 'package:flutter/widgets.dart';
import 'package:qr_app/route_names.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void navigate(RouteNames name) {
    navigatorKey.currentState.pushNamed(name.route);
  }

  void pop() {
    navigatorKey.currentState.pop();
  }
}
