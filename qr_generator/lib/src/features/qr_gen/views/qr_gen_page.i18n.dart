import 'package:i18n_extension/i18n_extension.dart';

const kQRCodeMessage = 'QR Code';

const kPressButtonMessage = 'Press the button to generate a code.';
const kSomethingWentWrongMessage = 'Something went wrong...';
const kQRCodeExpiredMessage =
    '''Your code has expired, please generate a new one.''';

/// This extension method contains all
/// the strings for the QRCodeGen view
extension QRCodeGenStrings on String {
  static final _t = Translations('en_us') +
      {
        'en_us': kQRCodeMessage,
        'es_es': 'Código QR',
      } +
      {
        'en_us': kPressButtonMessage,
        'es_es': 'Presiona el botón para generar un código.',
      } +
      {
        'en_us': kSomethingWentWrongMessage,
        'es_es': 'Algo salió mal...',
      } +
      {
        'en_us': kQRCodeExpiredMessage,
        'es_es': 'Tu código expiró, por favor genera uno nuevo.',
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
