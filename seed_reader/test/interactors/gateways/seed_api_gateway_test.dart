import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:seed_reader/errors.dart';
import 'package:seed_reader/interactors/gateways/seed_api_gateway.dart';
import 'package:seed_reader/models/seed.dart';

import '../../mocks/mock_generator.mocks.dart';

late SeedApiGateway _apiGateway;
late MockClient _httpMock;

void main() {
  setUp(() {
    _httpMock = MockClient();
    _apiGateway = SeedApiGateway(client: _httpMock);
  });

  group('#fetchSeed', () {
    test('when succeed to fetch then returns it', () async {
      final Seed seed = Seed(
        value: 'foo',
        expiration: DateTime(2020, 1, 1),
      );
      when(
        _httpMock.get(
          Uri.parse('https://seed-generator.herokuapp.com/api/seed'),
        ),
      ).thenAnswer(
        (_) => Future<Response>.value(
          Response(
            json.encode(seed),
            200,
          ),
        ),
      );

      expect(_apiGateway.fetchSeed(), completion(seed));
    });
    test(
      'when fails to fetch then returns error',
      () async {
        when(
          _httpMock.get(
            Uri.parse('https://seed-generator.herokuapp.com/api/seed'),
          ),
        ).thenAnswer(
          (_) => Future<Response>.value(
            Response(
              json.encode(<String, dynamic>{}),
              400,
            ),
          ),
        );

        expect(
          _apiGateway.fetchSeed(),
          throwsA(isA<FailToFetchSeed>()),
        );
      },
    );
  });
}
