import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:seed_reader/interactors/gateways/seed_local_gateway.dart';
import 'package:seed_reader/models/seed.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mocks/mock_generator.mocks.dart';

late SeedLocalGateway _localGateway;
late MockSharedPreferences _prefsMock;
void main() {
  setUp(() {
    _prefsMock = MockSharedPreferences();
    _localGateway = SeedLocalGateway(
      prefs: () => Future<SharedPreferences>.value(_prefsMock),
    );
  });

  group('#fetchSeed', () {
    test('when succeed to fetch then returns it', () async {
      final Seed seed = Seed(
        value: 'foo',
        expiration: DateTime(2020, 1, 1),
      );
      when(_prefsMock.getString('seed')).thenReturn(json.encode(seed));

      expect(_localGateway.fetchSeed(), completion(seed));
    });
    test('when has no seed then returns null', () async {
      when(_prefsMock.getString('seed')).thenReturn(null);

      expect(_localGateway.fetchSeed(), completion(null));
    });
  });

  test('#saveSeed', () async {
    when(_prefsMock.setString('seed', any)).thenAnswer(
      (_) => Future<bool>.value(true),
    );
    final Seed seed = Seed(
      value: 'foo',
      expiration: DateTime(2020, 1, 1),
    );

    await _localGateway.saveSeed(seed);

    verify(_prefsMock.setString('seed', json.encode(seed)));
  });
}
