import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:qrgenerator/app/intl/lang/en/strings_en.dart';
import 'package:qrgenerator/app/intl/lang/es/strings_es.dart';
import 'package:qrgenerator/app/intl/lang/lang.dart';
import 'package:qrgenerator/core/intl/core_strings.dart';
import 'package:qrgenerator/core/logging/logger.dart';

class AppStrings extends CoreStrings {
  static const LocalizationsDelegate<AppStrings> delegate = _AppStringsDelegate();

  static const localizationsDelegates = [
    AppStrings.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const supportedLocales = [
    Locale(Lang.en),
    Locale(Lang.es),
  ];

  static Function localizationCallback = (Locale locale, Iterable<Locale> supportedLocales) {
    for (Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode || supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return null;
  };

  static AppStrings of(BuildContext context) {
    return Localizations.of<AppStrings>(context, AppStrings);
  }

  final _log = getLogger("AppStrings");

  final Locale locale;

  AppStrings(this.locale);

  // Override from CoreStrings to looking the string from the language dictionary.
  @override
  String getString(String key) {
    Map<String, String> strings = _getStrings(locale);
    String value = strings[key];
    if (value == null || value.isEmpty) {
      _log.e("String not found: $key");
    }
    return value;
  }

  Map<String, String> _getStrings(Locale locale) {
    Map<String, String> strings = {};
    String lang = locale.languageCode;
    if (lang == Lang.en) {
      strings = strings_en;
    } else if (lang == Lang.es) {
      strings = strings_es;
    } else {
      _log.e("No strings found for lang: $lang");
    }
    return strings;
  }
}

class _AppStringsDelegate extends LocalizationsDelegate<AppStrings> {
  const _AppStringsDelegate();

  @override
  bool isSupported(Locale locale) => Lang.all.contains(locale.languageCode);

  @override
  Future<AppStrings> load(Locale locale) async {
    AppStrings strings = AppStrings(locale);

    // If we're given "en_US", we'll use it as-is. If we're
    // given "en", we extract it and use it.
    final String localeName =
        locale.countryCode == null || locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    // We make sure the locale name is in the right format e.g.
    // converting "en-US" to "en_US".
    final String canonicalLocaleName = Intl.canonicalizedLocale(localeName);

    // Force the locale in Intl.
    Intl.defaultLocale = canonicalLocaleName;

    // Set the core RStrings instance so all packages can access strings.
    coreStrings = strings;

    return SynchronousFuture<AppStrings>(strings);
  }

  @override
  bool shouldReload(_AppStringsDelegate old) => false;
}
