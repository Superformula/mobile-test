import 'package:flutter/material.dart';

import 'intl/app_localizations.dart';

typedef Widget BuildRootPage(BuildContext context);

class QrCodeApp extends StatelessWidget {
  final BuildRootPage buildRootPage;

  const QrCodeApp({
    @required this.buildRootPage,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) {
        return AppLocalizations.of(context).title;
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocals,
      home: Builder(
        builder: (context) => buildRootPage(context),
      ),
    );
  }
}
