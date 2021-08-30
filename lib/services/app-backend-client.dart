import 'dart:convert';

import 'package:http/http.dart';
import 'package:qr_generator/commons/constants.dart';
import 'package:qr_generator/models/qr-response-models.dart';
import 'package:qr_generator/services/app-endpoint.dart';
import 'package:qr_generator/services/app-http-client.dart';
import 'package:qr_generator/services/app-http-exception.dart';

class AppBackendClient {

  final AppHttpClient _client;
  final AppEndpoint _appEndpoint;

  static AppBackendClient? singleton;

  AppBackendClient._() :
      this._client = AppHttpClient(),
      this._appEndpoint = AppEndpoint(
        // the url of the api service
        host: Constants.appBackendHost,
        // the resource postfix such as /api/
        resource: ""
      );

  factory AppBackendClient.getInstance() {
    if(singleton == null) {
      singleton = AppBackendClient._();
    }
    return singleton!;
  }


  Future<QRSeed> getGeneratedSeed() async {
    var endpoint = _appEndpoint.buildPath(path: "/seed");

    Response response = await _client.get(endpoint.toUri());

    if(!response.statusCode.toString().startsWith("2")) {
      throw AppHttpException(jsonDecode(response.body).toString());
    }

    return QRSeed.fromJson(jsonDecode(response.body));
  }
}