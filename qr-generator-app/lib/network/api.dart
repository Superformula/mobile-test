import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qr_generator_app/model/qr_data.dart';

class Api {
  Future<QrData> getSeed() => http
      .get(Uri.parse("localhost:3000/seed")) // todo get a real domain
      .then((response) => QrData.fromJson(jsonDecode(response.body)));
}
