// ignore_for_file: public_member_api_docs
import 'package:i18n_extension/i18n_extension.dart';

const kScanResult = 'Scan result';
const kQrScan = 'QR Scan';
const kLongPressToCopy = 'Long press the code to copy it';
const kTextCopied = 'The code has been copied to clipboard.';
const kNoCodeScanned = 'No code has been scanned.';
const kStartScan = 'Start QR scan';

/// This extension method contains all
/// the strings for the QrGeneratorPage view
extension QrGeneratorPageStrings on String {
  static final _t = Translations('en_us') +
      {
        'en_us': kScanResult,
        'es_es': 'Resultado de scaneo',
      } +
      {
        'en_us': kQrScan,
        'es_es': 'Escaneo Qr',
      } +
      {
        'en_us': kLongPressToCopy,
        'es_es': 'Presiona para copiar el codigo.',
      } +
      {
        'en_us': kTextCopied,
        'es_es': 'El codigo se ha copiado.',
      } +
      {
        'en_us': kNoCodeScanned,
        'es_es': 'No se ha escaneado un codigo.',
      } +
      {
        'en_us': kStartScan,
        'es_es': 'Iniciar scan QR',
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
