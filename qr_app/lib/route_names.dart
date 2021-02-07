import 'package:flutter/foundation.dart';

enum RouteNames { Home }

extension routeNameExt on RouteNames {
  String get route {
    return describeEnum(this);
  }
}
