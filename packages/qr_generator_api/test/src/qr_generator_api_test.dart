// ignore_for_file: prefer_const_constructors
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:qr_generator_api/qr_generator_api.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('QrGeneratorApi', () {
    late http.Client httpClient;
    late QrGeneratorApi qrGeneratorApi;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      qrGeneratorApi = QrGeneratorApi(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(QrGeneratorApi(), isNotNull);
      });
    });

    group('getSeed', () {
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        try {
          await qrGeneratorApi.getSeed();
        } catch (_) {}

        verify(
          () => httpClient.get(
            Uri.https('-', 'seed'),
          ),
        ).called(1);
      });

      test('throws SeedNotFoundFailure on empty response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        expect(
          () async => qrGeneratorApi.getSeed(),
          throwsA(isA<SeedQrGeneratorNotFoundException>()),
        );
      });

      test('throws SeedRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        expect(
          () async => qrGeneratorApi.getSeed(),
          throwsA(isA<SeedRequestQrGeneratorException>()),
        );
      });

      test('returns qr code on valid response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(
          '''
          {
            "seed": "1232ddad29204",
            "expires_at": "2022-09-12T01:00"
          }
          ''',
        );
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        final actual = await qrGeneratorApi.getSeed();
        expect(
          actual,
          isA<QrCodeRM>(),
        );
      });
    });
  });
}
