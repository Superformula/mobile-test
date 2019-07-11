import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:qr_generator/services/api_service.dart';

class MockClient extends Mock implements http.Client {}

main() {
  const BASE_API_URL =
      'https://us-central1-qr-scanner-a71db.cloudfunctions.net/api';

  group('getSeed', () {
    test('returns a Seed object if the http call is successful', () async {
      final client = MockClient();

      when(client.get('$BASE_API_URL/seed')).thenAnswer((_) async => http.Response(
          '{"seed":"3caaa3ce-5bf4-4be6-839a-b5ef60d6cb5d","expires_at":"2019-07-11T15:53:13.658Z"}',
          200));

      expect(await ApiService.getSeed(client: client),
          isInstanceOf<Map<String, dynamic>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      when(client.get('$BASE_API_URL/seed'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(ApiService.getSeed(client: client), throwsException);
    });
  });
}
