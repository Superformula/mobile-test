import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'intl/app_localizations.dart';
import 'intl/app_localizations_delegate.dart';

typedef Widget RootPage(BuildContext context);

class QrCodeApp extends StatelessWidget {
  final RootPage buildRootPage;

  const QrCodeApp({
    @required this.buildRootPage,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) {
        return AppLocalizations.of(context).title;
      },
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocals,
      home: Builder(
        builder: (context) => buildRootPage(context),
      ),
    );
  }
}
