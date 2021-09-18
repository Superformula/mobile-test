import 'package:flutter/material.dart';
import 'package:superformula_mobile_test/presentation/app_router.gr.dart';

final appRouter = AppRouter();

class SuperFormulaChallengeApp extends StatelessWidget {
  const SuperFormulaChallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SuperFormula Challenge',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
