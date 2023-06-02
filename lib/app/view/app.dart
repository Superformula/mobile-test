import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qr_code/home/home.dart';
import 'package:qr_code_repository/qr_code_repository.dart';

class App extends StatelessWidget {
  const App({
    required this.qrCodeRepository,
    super.key,
  });

  final QrCodeRepository qrCodeRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: qrCodeRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('pt', 'BR'),
      ],
      home: HomePage(),
    );
  }
}
