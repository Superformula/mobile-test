import 'dart:convert';

import 'package:qr_code/api/qr_code_api.dart';
import 'package:qr_code/model/seed.dart';

class ApiClient {
  ApiClient(this._api);

  final QrCodeApi _api;

  Future<Seed> fetchSeed() async {
    final response = await _api.fetchSeed();
    if (response.isSuccessful) {
      final body = json.decode(response.body as String) as Map<String, dynamic>;
      if (body != null) {
        return Seed(value: body['seed'], expiresAt: DateTime.parse(body['expires_at']));
      }
    }
    throw Exception();
  }

  Future<bool> validateQrCode(String codeToValidate) async {
    final response = await _api.validateQrCode(codeToValidate);
    if (response.isSuccessful) {
      final body = json.decode(response.body as String) as Map<String, dynamic>;
      if (body != null) {
        return body['is_valid'];
      }
    }
    throw Exception();
  }
}
