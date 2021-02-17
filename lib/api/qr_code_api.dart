import 'package:chopper/chopper.dart';

part 'qr_code_api.chopper.dart';

@ChopperApi()
abstract class QrCodeApi extends ChopperService {
  static QrCodeApi create() {
    final client = ChopperClient(
      baseUrl: 'https://89irkqpoy4.execute-api.us-east-1.amazonaws.com/dev',
      services: [_$QrCodeApi()],
    );

    return _$QrCodeApi(client);
  }

  @Get(path: '/seed')
  Future<Response> fetchSeed();

  @Post(path: '/seed/{codeToValidate}/validate')
  Future<Response> validateQrCode(@Path() String codeToValidate);
}
