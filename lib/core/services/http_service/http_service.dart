import 'package:get/get.dart';
import 'package:http/http.dart' as http;

///the idea with this class was to abstract away some of the details that may end up repeated, like headers, etc
class HttpService {
  String host = 'https://8mpaf1q1g5.execute-api.us-west-1.amazonaws.com';
  Map<String, String> headers = {
    //TODO important to secure api key using env variables?
    'x-api-key': 'VVTUTAdalB55yRKQzsM7u6RTowrcUUhJLA82hoN6'
  };

  Future get(String endpoint) async {
    try {
      final response = await http.get(
        Uri.parse(host + endpoint),
        headers: headers,
      );
      return parseStatusCode(response);
    } catch (e) {
      print(e);
    }
  }

  parseStatusCode(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;

      ///Handle other status
      default:
    }
  }
}

mixin HttpServiceMixin {
  HttpService get httpService => Get.find<HttpService>();
}
