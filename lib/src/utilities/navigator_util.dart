import 'package:flutter/widgets.dart';

class NavigatorUtil {
  factory NavigatorUtil() => singleton ??= NavigatorUtil._internal();

  NavigatorUtil._internal();
  static NavigatorUtil singleton;

  Future<T> push<T extends Object>(BuildContext context, Route<T> route) =>
      Navigator.of(context).push(route);

  Future<T> pushAndRemoveUntil<T extends Object>(
          BuildContext context, Route<T> route, RoutePredicate predicate) =>
      Navigator.of(context).pushAndRemoveUntil(
        route,
        predicate,
      );

  void popUntil<T extends Object>(
          BuildContext context, RoutePredicate predicate) =>
      Navigator.of(context).popUntil(predicate);

  void pop<T extends Object>(BuildContext context) =>
      Navigator.of(context).pop();
}
