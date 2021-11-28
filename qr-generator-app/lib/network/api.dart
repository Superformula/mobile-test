import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qr_generator_app/model/seed.dart';

class Api {
  Future<Seed> getSeed() => http
      .get(Uri.parse("http://0fab-74-134-28-78.ngrok.io/seed"))
      .then((response) => Seed.fromJson(jsonDecode(response.body)));
}
