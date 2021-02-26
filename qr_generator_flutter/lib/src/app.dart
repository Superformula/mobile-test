import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';

import 'package:qr_generator_flutter/src/core/styles/app_colors.dart';
import 'core/dependency_injection.dart';

import 'features/qr_generator/logic/qr_generator_cubit.dart';
import 'features/qr_generator/views/qr_generator_page.dart';
import 'features/qr_scanner/logic/qr_scanner_cubit.dart';

/// Main Entry for [QrGeneratorApp]
class QrGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QrGeneratorCubit>(
          create: (context) => getIt<QrGeneratorCubit>(),
        ),
        BlocProvider<QrScannerCubit>(
          create: (context) => getIt<QrScannerCubit>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        localizationsDelegates: [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', 'ES'),
        ],
        theme: ThemeData(
          primaryColor: AppColors.purple,
          backgroundColor: AppColors.purple,
          scaffoldBackgroundColor: AppColors.black,
        ),
        home: I18n(
          child: const QrGeneratorPage(),
        ),
      ),
    );
  }
}
