import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../routes/scan_seed/scan_seed_page.dart';
import '../../routes/scan_seed/scan_seed_page_bloc.dart';
import '../app_route.dart';

class ScanRoute implements AppRoute {
  const ScanRoute();

  @override
  bool canHandle(String route) => route == '/scan';

  @override
  Route<T> handle<T>(RouteSettings settings) {
    return MaterialPageRoute<T>(
      builder: (_) => MultiProvider(
        providers: <SingleChildWidget>[
          Provider<ScanSeedPageBloc>(
            create: (_) => ScanSeedPageBloc(
              seedInteractor: GetIt.I(),
            ),
          ),
        ],
        child: const ScanSeedPage(),
      ),
    );
  }
}
