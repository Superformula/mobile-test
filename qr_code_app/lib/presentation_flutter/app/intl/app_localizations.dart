import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations_delegate.dart';
import 'strings_en.dart';
import 'strings_es.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': stringsEn,
    'es': stringsEs,
  };

  static List<Locale> supportedLocals = [
    const Locale('en', ''),
    const Locale('es', ''),
  ];

  String get title => _localizedValues[locale.languageCode]['title'];

  static List<LocalizationsDelegate> localizationsDelegates = [
    const AppLocalizationsDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
