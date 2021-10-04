import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'routes/app_route.dart';
import 'routes/generate_seed/generate_seed_route.dart';
import 'routes/home/home_route.dart';
import 'routes/scan_seed/scan_seed_route.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Iterable<AppRoute> routes = <AppRoute>[
      GenerateSeedRoute(),
      ScanRoute(),
      HomeRoute(),
    ];

    return MaterialApp(
      onGenerateRoute: routes.onGenerateRoute,
      initialRoute: '/home',
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
