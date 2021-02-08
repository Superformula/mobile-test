import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:qr_app/services/configuration_service.dart';
import 'package:qr_app/utils/errors/http_error.dart';

class HttpService {
  String get _host => GetIt.instance<ConfigurationService>().host;

  Future<String> get(String url) async {
    var response = await http.get('$_host$url');
    if (response.statusCode == 200) {
      return response.body;
    }
    throw HttpError(
      url: url,
      code: response.statusCode,
      message: 'Error on get',
      details: response.body,
    );
  }
}
