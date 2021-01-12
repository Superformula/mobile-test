import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:qr_app/data/models/qr_model.dart';
import 'package:qr_app/data/services/qr_service.dart';

class MockClient extends Mock implements http.Client {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  QrService qrService = QrService();
  group('fetchQrData', () {
    test('returns a QrModel if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com:3000/seed'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(await qrService.fetchQrData(client), isA<QrModel>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com:3000/seed'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(qrService.fetchQrData(client), throwsException);
    });
  });

  group('validateQrData', () {
    test('returns a Json string if the http call completes successfully',
        () async {
      final client = MockClient();
      final String seed = 'invalid seed';
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.post('https://jsonplaceholder.typicode.com:3000/validate',
              body: {'seed': seed}))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(await qrService.validateQrData(client, seed), isA<String>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      final String seed = 'invalid seed';
      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com:3000/seed'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(qrService.validateQrData(client, seed), throwsException);
    });
  });
}
