import 'package:flutter/material.dart';
import 'package:flutter_app/i18n/app_localizations.dart';

extension LocalizedString on String {
  String localize(BuildContext context) {
    var result = AppLocalizations.of(context).translate(this);
    return result ?? '';
  }
}