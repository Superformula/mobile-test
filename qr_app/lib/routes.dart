import 'package:qr_app/pages/pages.dart';

import 'route_names.dart';

final routes = {
  RouteNames.Code.route: (_) => CodePage(),
  RouteNames.Home.route: (_) => HomePage(),
  RouteNames.Scan.route: (_) => ScanPage(),
};
