import 'dart:convert' as convert;
import 'package:http/http.dart';
import 'package:qrGenerator/data/api/api_client.dart';

import '../../domain/models/seed_dto.dart';

/// API class that defines endpoints for Seed objects. It makes API calls via its ApiClient instance.
class SeedApi {
  final RestApiClient apiClient;

  SeedApi([RestApiClient apiClient]) : apiClient = apiClient ?? ApiClient();

  /// Fetch a Seed
  Future<SeedDTO> getSeed() async {
    // create path
    var path = '/seed';

    // make API call
    Response response = await apiClient.invokeApi(path, 'GET');
    if (response.statusCode == 200) {
      SeedDTO jsonSeed = deserialize(convert.utf8.decode(response.bodyBytes));
      return jsonSeed;
    } else if (response.statusCode >= 500) {
      throw new Exception('${response.statusCode} - Server Error');
    } else if (response.statusCode >= 400) {
      throw new Exception('${response.statusCode} - Input Error');
    } else {
      return null;
    }
  }

  SeedDTO deserialize(dynamic json) {
    var decodedJson = convert.jsonDecode(json);
    return SeedDTO.fromJson(decodedJson);
  }
}

