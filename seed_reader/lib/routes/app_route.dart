import 'package:flutter/material.dart';
import '../generated/l10n.dart';

abstract class AppRoute {
  bool canHandle(String route);
  Route<T> handle<T>(RouteSettings settings);
}

class _RouteNotFound implements AppRoute {
  const _RouteNotFound();

  @override
  bool canHandle(String route) => true;

  @override
  Route<T> handle<T>(RouteSettings settings) => MaterialPageRoute<T>(
        builder: (BuildContext context) => Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text(S.of(context).unknownRouteMessage),
          ),
        ),
      );
}

const _RouteNotFound _defaultRoute = _RouteNotFound();

extension GenerateRoute on Iterable<AppRoute> {
  Route<T> onGenerateRoute<T>(RouteSettings settings) {
    final String? routeName = settings.name;
    if (routeName == null) {
      return _defaultRoute.handle(settings);
    }
    return firstWhere(
      (AppRoute route) => route.canHandle(routeName),
      orElse: () => _defaultRoute,
    ).handle(settings);
  }
}
