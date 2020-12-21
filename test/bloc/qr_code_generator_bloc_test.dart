import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/src/bloc/qr_code_generator_bloc.dart';
import 'package:mobile_test/src/model/seed.dart';
import 'package:mobile_test/src/services/respository.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../model/seed_mock.dart';

class MockSeedRepository extends Mock implements SeedRepository {}

void main() {
  test('throws AssertionError if SeedRepository is null', () {
    expect(
      () => QRCodeGeneratorBloc(seedRepository: null),
      throwsA(isAssertionError),
    );
  });

  test('load stuff must sink Response', () {
    MockSeedRepository mockSeedRepository = MockSeedRepository();
    when(mockSeedRepository.fetchSeed()).thenAnswer(
        (_) => Future<SeedResponse>.value(SeedResponse.fromJson(mockSeed)));
    final QRCodeGeneratorBloc qrCodeGeneratorBloc =
        QRCodeGeneratorBloc(seedRepository: mockSeedRepository);
    qrCodeGeneratorBloc.qrCodeSeed.listen((response) {
      expect(response, isA<QrImage>());
    });
    qrCodeGeneratorBloc.qrCodeExpiresAt.listen((response) {
      expect(response, isA<String>());
    });
    qrCodeGeneratorBloc.getGenerateQRCode();
  });

  test('Check if QR code is not expired', () {
    MockSeedRepository mockSeedRepository = MockSeedRepository();
    final QRCodeGeneratorBloc qrCodeGeneratorBloc =
        QRCodeGeneratorBloc(seedRepository: mockSeedRepository);
    expect(
        qrCodeGeneratorBloc
            .checkQrCodeIsValid("COLPTD1YYA910YPAGW4WJYCF1GO979ZP|2031-10-10"),
        true);
  });

  test('Check if QR code is expired', () {
    MockSeedRepository mockSeedRepository = MockSeedRepository();
    final QRCodeGeneratorBloc qrCodeGeneratorBloc =
        QRCodeGeneratorBloc(seedRepository: mockSeedRepository);
    expect(
        qrCodeGeneratorBloc
            .checkQrCodeIsValid("COLPTD1YYA910YPAGW4WJYCF1GO979ZP|2020-10-10"),
        false);
  });
}
