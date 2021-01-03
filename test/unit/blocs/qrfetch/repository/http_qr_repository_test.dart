import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  Dio client;

  setUp(() {
    client = MockDioClient();
  });

  group("HttpQRRepository", () {
    test("Making sure that 'HttpQRRepository' instances are properly compared", () {
      expect(const HttpQRRepository(), const HttpQRRepository());
    });

    test("Making sure that a 'Seed' is properly built", () async {
      // Mocking the "get" method of Dio to return a fake object
      when(client.get<String>(any)).thenAnswer((_) async => Response<String>(
        data: jsonEncode({
          "seed": "abc",
          "expires_at": "123"
        })
      ));

      final repo = HttpQRRepository();
      final data = await repo.getData(dio: client);

      // Making sure that the 'Seed' object has been properly built
      expect(data, isA<Seed>());
      expect(data.seed, equals("abc"));
      expect(data.expiryDate, equals("123"));
    });
  });
}