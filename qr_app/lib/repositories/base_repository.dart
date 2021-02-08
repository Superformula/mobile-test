import 'package:get_it/get_it.dart';
import 'package:qr_app/services/http_service.dart';

abstract class BaseRepository {
  HttpService get service => GetIt.instance<HttpService>();
}
