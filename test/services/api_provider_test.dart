import 'dart:convert';
import 'dart:io' as io;

import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mobile_test/src/model/seed.dart';
import 'package:mobile_test/src/services/custom_exceptions.dart';
import 'package:mobile_test/src/services/custom_http500_exception.dart';
import 'package:mobile_test/src/services/seed_api_provider.dart';
import 'package:mockito/mockito.dart';

import '../mock_set_up/mock_classes.dart';
import '../model/seed_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  io.HttpOverrides.global = null;

  test('get successful response for seed api', () async {
    await dot_env.load();
    SeedApiProvider().client = MockClient((Request request) async {
      return Response(json.encode(mockSeed), 200);
    });
    expect(await SeedApiProvider().getSeedResponse() is SeedResponse, true);
  });

  test('throw Http500Exception for bad response from get seed api', () async {
    await dot_env.load();
    SeedApiProvider().client = MockClient((Request request) async {
      return Response(json.encode(mockSeed), 500);
    });

    expect(() => SeedApiProvider().getSeedResponse(),
        throwsA(isInstanceOf<Http500Exception>()));
  });

  test('throw BadRequestException for bad response from get seed api',
      () async {
    await dot_env.load();
    SeedApiProvider().client = MockClient((Request request) async {
      return Response(json.encode(mockSeed), 400);
    });
    expect(() => SeedApiProvider().getSeedResponse(),
        throwsA(isInstanceOf<BadRequestException>()));
  });

  test('throw UnauthorisedException for bad response from get seed api',
      () async {
    await dot_env.load();
    SeedApiProvider().client = MockClient((Request request) async {
      return Response(json.encode(mockSeed), 401);
    });
    expect(() => SeedApiProvider().getSeedResponse(),
        throwsA(isInstanceOf<UnauthorisedException>()));
  });

  test('retry logic is used when response throws format exception', () async {
    await dot_env.load();
    final MockCustomClient mockCustomClient = MockCustomClient();
    SeedApiProvider().client = mockCustomClient;
    when(mockCustomClient.get(
      any,
      headers: anyNamed('headers'),
    )).thenAnswer(
      (_) => Future<Response>.value(
        Response(
          'format exception',
          500,
        ),
      ),
    );

    try {
      await SeedApiProvider().getSeedResponse();
    } catch (e) {
      expect(e is Http500Exception, isTrue);
    }
    verify<dynamic>(
            SeedApiProvider().client.get(any, headers: anyNamed('headers')))
        .called(3);
  });

  test('retry logic is not used when response is not a format exception',
      () async {
    await dot_env.load();
    final MockCustomClient mockCustomClient = MockCustomClient();
    SeedApiProvider().client = mockCustomClient;
    when(mockCustomClient.get(
      any,
      headers: anyNamed('headers'),
    )).thenAnswer(
      (_) => Future<Response>.value(
        Response(
          'UnauthorisedException exception',
          401,
        ),
      ),
    );
    try {
      await SeedApiProvider().getSeedResponse();
    } catch (e) {
      expect(e is UnauthorisedException, isTrue);
    }
    verify<dynamic>(
            SeedApiProvider().client.get(any, headers: anyNamed('headers')))
        .called(1);
  });
}
