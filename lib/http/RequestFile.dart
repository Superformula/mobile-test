import 'dart:convert';
import 'package:generator/Model/model.dart';
import 'package:generator/Static-data/http-data.dart';
import 'package:http/http.dart' as http;

class HttpProvider {
  fetchData() async {
    var uri = Uri.http('$url:$port', '$apiGetRequest');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return QueryData.fromJson(jsonResponse);
    }
  }
}
