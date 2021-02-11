import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:qr_app/models/model_base.dart';
import 'package:qr_app/services/services.dart';
import 'package:qr_app/utils/errors/http_error.dart';

typedef T CreateFromJson<T>(String json);

abstract class RepositoryBase<T extends ModelBase> {
  String get _host => GetIt.instance<ConfigurationService>().host;

  Future<T> get(String url, CreateFromJson create) async {
    var response = await http.get('$_host$url');

    if (response.statusCode == 200) return create(response.body);

    throw HttpError(
      url: url,
      code: response.statusCode,
      message: 'Error on get',
      details: response.body,
    );
  }
}
