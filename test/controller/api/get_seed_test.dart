import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([http.Client])
void main() {
  group('Get seed', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient((request) async {
        return http.Response(
            json.encode(
                {'seed': 'abcdefghijkl', 'expiresAT': "2021-11-12T21:45:30"}),
            200);
      });
    });
  });
}
