import 'package:flutter/foundation.dart';

enum RouteNames { Code, Home, Scan }

extension routeNameExt on RouteNames {
  String get route {
    return describeEnum(this);
  }
}
