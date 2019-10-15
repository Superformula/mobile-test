import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/pages/generator/generator_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("QR Code api return success", () async {
    final barcodeResponse = "SUCCESS";

    setupMockLocator(barcodeResponse);
    final GeneratorBloc bloc = locator();

    await expectLater(bloc.qrCodeSeedObservable, emitsThrough('9b0a34057c9d302628e1d7ef50e37b08'));
  });

  test("QR Code api return empty data", () async {

    setupMockErrorLocator();
    final GeneratorBloc bloc = locator();

    await expectLater(bloc.qrCodeSeedObservable, emitsThrough(''));
  });
}