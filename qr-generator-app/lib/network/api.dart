import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qr_generator_app/model/seed.dart';

class Api {
  Future<Seed> getSeed() => http
      .get(Uri.parse("localhost:3000/seed"))
      .then((response) => Seed.fromJson(jsonDecode(response.body)));
}
