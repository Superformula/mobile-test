import 'dart:convert';
import 'package:mobile_test/model/seed_gen_model.dart';
import 'package:http/http.dart' as http;
import 'device_info.dart';

class GenCode {
  Deviceinfo info = Deviceinfo();

  Future<SeedGenModel> fetchCode() async {
    String deviceId = await info.getDeviceDetails();

    final url = Uri.parse('http://localhost:8080/generate_code').replace(queryParameters: {
      'id': deviceId,
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then return response
      return SeedGenModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to generate the code');
    }
  }
}
