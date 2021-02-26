// ignore_for_file: public_member_api_docs
import 'package:i18n_extension/i18n_extension.dart';

const kQrGeneratorTitle = 'QrCode Generator';
const kWelcomeText =
    'Welcome to the QR-generator challenge implemented by Elian Ortega. To start please press the button in the bottom right corner of your screen';
const kCodeExpired =
    'The QR Code has expired. To generate a new one press the button in the bottom right corner of your screen ';
const kError =
    '🚨 An error occurred! 🚨\nPlease check your internet connection.';

/// This extension method contains all
/// the strings for the QrGeneratorPage view
extension QrGeneratorPageStrings on String {
  static final _t = Translations('en_us') +
      {
        'en_us': kQrGeneratorTitle,
        'es_es': 'Generador CodigoQr',
      } +
      {
        'en_us': kWelcomeText,
        'es_es':
            'Bienvenido al challenge de QR-generator implementado por Elian Ortega. Para empezar preciona el boton en la esquina inferior izquierd de la pantalla.',
      } +
      {
        'en_us': kCodeExpired,
        'es_es':
            'El código QR ha caducado. Para generar uno nuevo presione el botón en la esquina inferior derecha de su pantalla.',
      } +
      {
        'en_us': kError,
        'es_es':
            '🚨 Ha ocurrido un error 🚨\nPor favor revisa tu conexion a internet.',
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
