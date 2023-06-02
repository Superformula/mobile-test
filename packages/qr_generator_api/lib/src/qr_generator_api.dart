import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qr_generator_api/src/exceptions.dart';
import 'package:qr_generator_api/src/models/qr_code_rm.dart';

/// {@template qr_generator_api}
/// A Dart API Client for the QR Generator API
/// {@endtemplate}
class QrGeneratorApi {
  /// {@macro qr_generator_api}
  QrGeneratorApi({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  static const _baseUrlQrGenerator = '-';

  final http.Client _httpClient;

  /// Fetches [QrCodeRM] object.
  Future<QrCodeRM> getSeed() async {
    final seedRequest = Uri.https(_baseUrlQrGenerator, 'seed');
    final seedResponse = await _httpClient.get(seedRequest);

    if (seedResponse.statusCode != 200) {
      throw SeedRequestFailure();
    }

    final jsonObject = jsonDecode(seedResponse.body) as Map<String, dynamic>;

    if (!jsonObject.containsKey('seed')) throw SeedNotFoundFailure();

    final seedQrCode = QrCodeRM.fromJson(jsonObject);
    return seedQrCode;
  }
}
