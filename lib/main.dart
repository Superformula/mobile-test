import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_test/core/resources/app_routes.dart';
import 'package:superformula_test/core/resources/injector.dart';
import 'package:superformula_test/core/theme/app_theme.dart';
import 'package:superformula_test/view/pages/home_page.dart';

import 'view/blocs/qr_code_history_bloc/qr_code_history_bloc.dart';

void main() {
  InitializeInjector.instance.inject();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QrCodeHistoryCubit>(
      create: (context) => QrCodeHistoryCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.themeData,
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
      ),
    );
  }
}
