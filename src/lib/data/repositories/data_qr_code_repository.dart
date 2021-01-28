import 'dart:convert';

import 'package:qrcodevalidator/data/mappers/qr_code_mapper.dart';
import 'package:qrcodevalidator/domain/entities/qr_code.dart';
import 'package:qrcodevalidator/domain/repositories/qr_code_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class DataQRCodeRepository implements QRCodeRepository {
  Future<QRCode> getQRCode() async {
    var apiUrl = env['API_URL'];
    var apiKey = env['API_KEY'];

    var response = await http.get(
      '$apiUrl/default/random-qr-seed_seed',
      headers: {
        'x-api-key': apiKey,
      },
    );

    if (response.statusCode != 200) {
      throw Exception(
          'API returned with status code ${response.statusCode} - ${response.reasonPhrase}');
    }

    var qrCode = QRCodeMapper.fromMap(jsonDecode(response.body));

    return qrCode;
  }

  /// Validate QR Code.
  @override
  Future<bool> validateQRCode(QRCode qrCode, DateTime now) {
    // If needed, this can be changed to a server side validation.
    return Future.value(qrCode.isValid(now));
  }
}
