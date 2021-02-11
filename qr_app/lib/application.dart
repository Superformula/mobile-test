import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/route_names.dart';

import 'blocs/seed_bloc.dart';
import 'routes.dart';
import 'services/cache_service.dart';
import 'services/navigation_service.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<SeedBloc>(
      create: (_) => SeedBloc(),
      dispose: (_, bloc) {
        bloc.dispose();
        GetIt.instance<CacheService>().dispose();
      },
      child: MaterialApp(
        navigatorKey: GetIt.instance<NavigationService>().navigatorKey,
        initialRoute: RouteNames.Home.route,
        routes: routes,
      ),
    );
  }
}
