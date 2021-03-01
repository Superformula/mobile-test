import 'package:i18n_extension/i18n_extension.dart';

const kHomeMessage = 'Home';
const kNoItemsMessage = 'No items, go scan some!';

/// This extension method contains all
/// the strings for the Home view
extension HomeStrings on String {
  static final _t = Translations('en_us') +
      {
        'en_us': kHomeMessage,
        'es_es': 'Inicio',
      } +
      {
        'en_us': kNoItemsMessage,
        'es_es': 'No hay elementos, ¡ve a escanear!',
      };

  /// Getter to translate the string
  String get i18n => localize(this, _t);

  /// Method for interpolating strings
  String fill(List<Object> params) => localizeFill(this, params);

  /// Method for pluralizing strings
  String plural(int value) => localizePlural(value, this, _t);

  /// Method for creating custom modifiers according to any conditions
  String version(Object modifier) => localizeVersion(modifier, this, _t);

  /// Method for retrieving all the custom modifiers
  Map<String, String> allVersions() => localizeAllVersions(this, _t);
}
