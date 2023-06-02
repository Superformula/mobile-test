// ignore_for_file: prefer_const_constructors
import 'package:domain_models/domain_models.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_code_repository/qr_code_repository.dart';
import 'package:qr_generator_api/qr_generator_api.dart';
import 'package:test/test.dart';

class MockQrGeneratorApi extends Mock implements QrGeneratorApi {}

void main() {
  group('QrCodeRepository', () {
    late QrGeneratorApi remoteApi;
    late QrCodeRepository qrCodeRepository;

    const qrCode = QrCodeRM(seed: '11o92d000d22d2j9');

    setUp(() {
      remoteApi = MockQrGeneratorApi();
      qrCodeRepository = QrCodeRepository(
        remoteApi: remoteApi,
      );
    });

    group('getSeed', () {
      test('calls getSeed correctly', () async {
        when(() => remoteApi.getSeed()).thenAnswer((_) async => qrCode);
        await qrCodeRepository.getSeed();
        verify(
          () => remoteApi.getSeed(),
        ).called(1);
      });

      test('throws SeedNotFoundException when getSeed fails', () async {
        final exceptionApi = SeedQrGeneratorNotFoundException();
        when(() => remoteApi.getSeed()).thenThrow(exceptionApi);
        expect(
          () => qrCodeRepository.getSeed(),
          throwsA(isA<SeedNotFoundException>()),
        );
      });

      test('throws SeedRequestException when getSeed fails', () async {
        final exceptionApi = SeedRequestQrGeneratorException();
        when(() => remoteApi.getSeed()).thenThrow(exceptionApi);
        expect(
          () => qrCodeRepository.getSeed(),
          throwsA(isA<SeedRequestException>()),
        );
      });
    });
  });
}
