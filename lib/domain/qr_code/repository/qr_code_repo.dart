import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:superformula_test/domain/qr_code/model/seed_model.dart';

part 'qr_code_repo.g.dart';

@RestApi(baseUrl: "http://127.0.0.1:8081/api")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/Seed")
  Future<Seed> getSeed();
}