import 'package:flutter/widgets.dart';
import 'package:qr_code_app/presentation_flutter/intl/strings_en.dart';
import 'package:qr_code_app/presentation_flutter/intl/strings_es.dart';

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
}
