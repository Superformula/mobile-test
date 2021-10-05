// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Something wrong happened`
  String get unknownRouteMessage {
    return Intl.message(
      'Something wrong happened',
      name: 'unknownRouteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homePageTitle {
    return Intl.message(
      'Home',
      name: 'homePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get homeActionScan {
    return Intl.message(
      'Scan',
      name: 'homeActionScan',
      desc: '',
      args: [],
    );
  }

  /// `QRCode`
  String get homeActionGenerate {
    return Intl.message(
      'QRCode',
      name: 'homeActionGenerate',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get scanPageTitle {
    return Intl.message(
      'Scan',
      name: 'scanPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `QRCode`
  String get generateSeedPageTitle {
    return Intl.message(
      'QRCode',
      name: 'generateSeedPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Generating seed...`
  String get generateSeedLoadingLabel {
    return Intl.message(
      'Generating seed...',
      name: 'generateSeedLoadingLabel',
      desc: '',
      args: [],
    );
  }

  /// `expires in`
  String get generateSeedExpiresLabel {
    return Intl.message(
      'expires in',
      name: 'generateSeedExpiresLabel',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong happened`
  String get generateSeedErrorMessage {
    return Intl.message(
      'Something wrong happened',
      name: 'generateSeedErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Trying in`
  String get generateSeedErrorTryAgain {
    return Intl.message(
      'Trying in',
      name: 'generateSeedErrorTryAgain',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
