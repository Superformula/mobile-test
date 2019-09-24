import 'package:qr_gen/core/models/seed.dart';
import 'package:dio/dio.dart';

abstract class QrService {
  getSeed();
}

class QrServiceImplementation extends QrService {
  var _dio = Dio();

  Future<Seed> getSeed() async {
    final response = await _dio.get('https://api-1g0f3ibnv.now.sh/api/qr');
    return Seed.fromJson(response.data);
  }
}
