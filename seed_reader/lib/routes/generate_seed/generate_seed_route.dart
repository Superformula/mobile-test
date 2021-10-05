import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../routes/generate_seed/generate_seed_page.dart';
import '../../routes/generate_seed/generate_seed_page_bloc.dart';
import '../app_route.dart';

class GenerateSeedRoute implements AppRoute {
  const GenerateSeedRoute();

  @override
  bool canHandle(String route) => route == '/generate_seed';

  @override
  Route<T> handle<T>(RouteSettings settings) {
    final GenerateSeedPageBloc bloc = GenerateSeedPageBloc(
      seedInteractor: GetIt.I(),
    );
    bloc.refreshSeed();

    return MaterialPageRoute<T>(
      builder: (_) => MultiProvider(
        providers: <SingleChildWidget>[
          Provider<GenerateSeedPageBloc>(
            create: (_) => bloc,
          ),
        ],
        child: const GenerateSeedPage(),
      ),
    );
  }
}
