import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:seed_reader/generated/l10n.dart';
import 'package:seed_reader/routes/app_route.dart';

class BaseWidgetTest extends StatelessWidget {
  const BaseWidgetTest({
    Key? key,
    this.navigatorKey,
    this.routes,
    this.child,
  }) : super(key: key);
  final GlobalKey<NavigatorState>? navigatorKey;
  final Iterable<AppRoute>? routes;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (routes ?? <AppRoute>[]).onGenerateRoute,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: child,
    );
  }
}
