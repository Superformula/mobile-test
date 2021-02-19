import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/src/bloc/qr_code_generator_bloc.dart';
import 'package:mobile_test/src/model/seed.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../mockSetUp/mock_classes.dart';
import '../model/seed_mock.dart';

void main() {
  test('throws AssertionError if SeedRepository is null', () {
    expect(
      () => QRCodeGeneratorBloc(repository: null),
      throwsA(isAssertionError),
    );
  });

  test('check seed data get added to stream', () async {
    final MockSeedRepository mockSeedRepository = MockSeedRepository();
    when(mockSeedRepository.fetchSeed()).thenAnswer(
        (_) => Future<SeedResponse>.value(SeedResponse.fromJson(mockSeed)));
    final QRCodeGeneratorBloc qrCodeGeneratorBloc =
        QRCodeGeneratorBloc(repository: mockSeedRepository);
    qrCodeGeneratorBloc.qrCodeSeed$.listen((QrImage response) {
      expect(response, isA<QrImage>());
    });
    qrCodeGeneratorBloc.qrCodeExpiresAt$.listen((String response) {
      expect(response, isA<String>());
    });
    await qrCodeGeneratorBloc.getGenerateQRCode(
        seedRepository: mockSeedRepository);
    expect(
        qrCodeGeneratorBloc.qrCodeExpiresAt$.value, '2080-02-18 06:42:30.000');
  });

  test('null seed data get added to stream without errors', () async {
    final MockSeedRepository mockSeedRepository = MockSeedRepository();
    when(mockSeedRepository.fetchSeed()).thenAnswer((_) =>
        Future<SeedResponse>.value(SeedResponse.fromJson(mockSeedNullData)));
    final QRCodeGeneratorBloc qrCodeGeneratorBloc =
        QRCodeGeneratorBloc(repository: mockSeedRepository);
    await qrCodeGeneratorBloc.getGenerateQRCode(
        seedRepository: mockSeedRepository);
    expect(qrCodeGeneratorBloc.qrCodeExpiresAt$.value, null);
    expect(qrCodeGeneratorBloc.qrCodeSeed$.value, null);
  });

  test('validate QR code that is not expired', () {
    final MockSeedRepository mockSeedRepository = MockSeedRepository();
    final QRCodeGeneratorBloc qrCodeGeneratorBloc =
        QRCodeGeneratorBloc(repository: mockSeedRepository);
    final DateTime parsedDateCurrent =
        DateTime.now().add(const Duration(seconds: 60));

    expect(
        qrCodeGeneratorBloc
            .validateQrCodeStatus('2a6abu##' + parsedDateCurrent.toString()),
        true);
  });

  test('validate if QR code is expired if dateTime is in the past', () {
    final MockSeedRepository mockSeedRepository = MockSeedRepository();
    final QRCodeGeneratorBloc qrCodeGeneratorBloc =
        QRCodeGeneratorBloc(repository: mockSeedRepository);

    expect(
        qrCodeGeneratorBloc
            .validateQrCodeStatus('2a6abu##2021-02-18T23:42:30.802Z'),
        false);
  });

  test('validate if QR code is expired if dateTime is at the current moment',
      () {
    final MockSeedRepository mockSeedRepository = MockSeedRepository();
    final QRCodeGeneratorBloc qrCodeGeneratorBloc =
        QRCodeGeneratorBloc(repository: mockSeedRepository);
    expect(
        qrCodeGeneratorBloc
            .validateQrCodeStatus('2a6abu##' + DateTime.now().toString()),
        true);
  });

  test('emits done event to listeners when the subject is closed', () async {
    final MockSeedRepository mockSeedRepository = MockSeedRepository();
    final QRCodeGeneratorBloc qrCodeGeneratorBloc =
        QRCodeGeneratorBloc(repository: mockSeedRepository);
    qrCodeGeneratorBloc.dispose();
    expect(qrCodeGeneratorBloc.expiresAtFetcher.isClosed, true);
    expect(qrCodeGeneratorBloc.seedFetcher.isClosed, true);
  });
}
