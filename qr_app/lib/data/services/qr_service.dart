import 'dart:convert';

import 'package:qr_app/data/models/qr_model.dart';
import 'package:qr_app/data/services/base_service.dart';
import 'package:http/http.dart' as http;

//
// This class has the api methods needed to call the server
// 

class QrService extends BaseService {
  //
  // The fetchQrData() method calls the server with a Get method  and returns a QrModel.
  // The model contains a random seed and an expiration time
  //
  Future<QrModel> fetchQrData(http.Client client) async {
    http.Response response;

    final hostAddress = await host;

    try {
      response = await client.get('$hostAddress:3000/seed');
      if (response.statusCode == 200) {
        final r = QrModel.fromJson(jsonDecode(response.body));
        return r;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Server error - failed to retrieve');
        //return Future.error('Failed to retrieve');
      }
    } catch (e) {
      throw Exception('Server error - connection refused');
      //   return Future.error('Server error - connection refused');
    }
  }
  //
  // The validateQrData() method calls the server with a post and has the Seed in the body.
  // The returned value contains the validation status
  //

  Future<String> validateQrData(http.Client client, String seed) async {
    http.Response response;
    String hostAddress = await host;
    try {
      response =
          await client.post('$hostAddress:3000/validate', body: {'seed': seed});
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return result['status'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Server error - failed to retrieve');
//        return Future.error('Failed to retrieve');
      }
    } catch (e) {
      throw Exception('Server error - connection refused');
//      return Future.error('Server error - connection refused');
    }
  }
}
