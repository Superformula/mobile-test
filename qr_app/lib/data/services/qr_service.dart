import 'dart:convert';

import 'package:qr_app/data/models/qr_model.dart';
import 'package:qr_app/data/services/base_service.dart';
import 'package:http/http.dart' as http;

class QrService extends BaseService {
  Future<QrModel> fetchQrData() async {
    http.Response response;
    String host = await getHost();
    try {
      response = await http.get('$host:3000/seed');
      if (response.statusCode == 200) {
        final r = QrModel.fromJson(jsonDecode(response.body));
        return r;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return Future.error('Failed to retrieve');
      }
    } catch (e) {
      return Future.error('Server error - connection refused');
    }
  }

  Future<String> validateQrData(String seed) async {
    http.Response response;
    String host = await getHost();
    try {
      response = await http.post('$host:3000/validate', body: {'seed': seed} );
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return result['status'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return Future.error('Failed to retrieve');
      }
    } catch (e) {
      return Future.error('Server error - connection refused');
    }
  }
}
