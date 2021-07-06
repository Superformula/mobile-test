import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:qrcode_app/data/datasource/seeds_api_datasource.dart';
import 'package:qrcode_app/domain/entities/seed.dart';

import 'seed_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  const URL = 'https://seed-server.herokuapp.com/seed';
  SeedApiDatasource apiDatasource;
  setUp(() {});

  group('fetch seed', () {
    test('returns a seed if the http call completes', () async {
      apiDatasource = SeedApiDatasource();
      final client = MockClient();
      when(client.get(Uri.parse(URL))).thenAnswer((_) async => http.Response(
          '{"seed":"RU-kDEoRh0g=","expiration":"2021-06-27 22:56:20.556149"}',
          200));
      expect(await apiDatasource.getSeed(client), isA<Seed>());
    });
    test('returns an error if the http call failures', () async {
      apiDatasource = SeedApiDatasource();
      final client = MockClient();
      when(client.get(Uri.parse(URL)))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(await apiDatasource.getSeed(client), throwsException);
    });
  });
}
