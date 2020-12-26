import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobile_test_app/model/qr_code.dart';

class QrRepository {
  static const baseUrl = '192.168.254.11';
  Future<QrCode> seed() async {
    final response = await get(Uri.http('$baseUrl:8888', '/seed'));
    final body = response.body;
    final data = jsonDecode(body);
    return QrCode.fromJson(data);
  }
}
