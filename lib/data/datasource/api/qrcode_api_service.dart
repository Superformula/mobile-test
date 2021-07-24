import 'package:dio/dio.dart';
import 'package:qrtestcodeone/data/model/qr_seed_datamodel.dart';
import 'package:retrofit/retrofit.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///
part 'qrcode_api_service.g.dart';

@RestApi()
abstract class QrCodeApiService {
  factory QrCodeApiService(Dio dio, {required String baseUrl}) =
      _QrCodeApiService;

  @GET("/seed")
  Future<QrSeedDataModel> getSeed(@Query('value') String seed);
}
