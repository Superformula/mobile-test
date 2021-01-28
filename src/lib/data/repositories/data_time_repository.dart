import 'package:qrcodevalidator/domain/repositories/time_repository.dart';

class DataTimeRepository extends TimeRepository {
  Future<DateTime> getCurrentTime() {
    // This can be switched for a server side time for reliability.
    return Future.value(DateTime.now());
  }
}
