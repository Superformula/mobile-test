import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:supercode/services/seed_service.dart';

class MockClient extends Mock implements Client {}

class MockResponse extends Mock implements Response {}

void main() {
  group('SeedService', () {
    String host;
    MockClient mockClient;
    SeedService seedService;

    setUp(() {
      host = 'test.host';
      mockClient = MockClient();
      seedService = SeedServiceImpl(
        host: host,
        client: mockClient,
      );
    });
    group('fetchSeed', () {
      test('should fetch a seed', () async {
        final mockResponse = MockResponse();
        when(mockResponse.statusCode).thenReturn(200);
        when(mockResponse.body).thenReturn(
            '{"seed":"abc123","expires_at":"2018-05-08T18:50:18Z"}');
        when(mockClient.get('$host/seed'))
            .thenAnswer((_) => Future.value(mockResponse));
        final result = await seedService.fetchSeed();
        expect(result.seed, 'abc123');
        expect(result.expiresAt, DateTime.parse('2018-05-08T18:50:18Z'));
      });
      test('should throw an error if request fails', () async {
        final mockReponse = MockResponse();
        when(mockReponse.statusCode).thenReturn(500);
        when(mockClient.get(any)).thenAnswer((_) => Future.value(mockReponse));
        expect(seedService.fetchSeed(), throwsException);
      });
    });
    group('validateSeed', () {
      test('should validate a code', () async {
        final code = 'abc123';
        final mockResponse = MockResponse();
        when(mockResponse.statusCode).thenReturn(200);
        when(mockResponse.body).thenReturn('{"is_valid":true}');
        when(mockClient.get('$host/validate?code=$code'))
            .thenAnswer((_) => Future.value(mockResponse));
        final result = await seedService.validateCode(code);
        expect(result, isTrue);
      });
      test('should throw an error if request fails', () async {
        final mockReponse = MockResponse();
        when(mockReponse.statusCode).thenReturn(500);
        when(mockClient.get(any)).thenAnswer((_) => Future.value(mockReponse));
        expect(seedService.validateCode('abc123'), throwsException);
      });
    });
  });
}
