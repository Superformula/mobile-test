import 'package:flutter/material.dart';
import 'package:superformula_mobile_test/presentation/app_router.gr.dart';
import 'package:superformula_mobile_test/presentation/core/misc/colors.dart';

final appRouter = AppRouter();

class SuperFormulaChallengeApp extends StatelessWidget {
  const SuperFormulaChallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SuperFormula Challenge',
      theme: ThemeData(
        primarySwatch: createMaterialColor(superformulaPrimaryColor),
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
