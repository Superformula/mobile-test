import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:matcher/matcher.dart';
import 'package:mobile_test/src/model/seed.dart';
import 'package:mobile_test/src/services/api_provider.dart';

import '../model/seed_mock.dart';

void main() {
  test('get successful response for seed api', () async {
    ApiProvider().client = MockClient((Request request) async {
      return Response(json.encode(mockSeed), 200);
    });
    expect(await ApiProvider().fetchSeed() is SeedResponse, true);
  });

  test('throw exception for bad response from get seed api', () async {
    ApiProvider().client = MockClient((Request request) async {
      return Response(json.encode(mockSeed), 500);
    });
    expect(() => ApiProvider().fetchSeed(),
        throwsA(const TypeMatcher<HttpException>()));
  });
}
