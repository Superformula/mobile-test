import 'package:dio/dio.dart';
import 'package:qr_code_test/configs/configurations.dart';
import 'package:test/test.dart';

void main() {
  test("Making sure that all configurations are set with a value", () {
    expect(Configurations.baseHttpEndpoint, isNotEmpty);
    expect(Configurations.baseHttpEndpointAndroid, isNotEmpty);
    expect(Configurations.dioHttpClientQR, isA<Dio>());
    expect(Configurations.slidingMenuWidth, isA<num>());
    expect(Configurations.slidingMenuWidth, isPositive);
  });
}