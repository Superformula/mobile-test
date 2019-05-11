import 'package:flutter_test/flutter_test.dart';
import 'package:supercode/models.dart';

void main() {
  group('Models', () {
    group('Seed', () {
      test('should parse JSON correctly', () {
        final json = {'seed': 'abc123', 'expires_at': '2018-05-08T18:50:18Z'};

        final seed = Seed.fromJson(json);

        expect(seed.seed, json['seed']);
        expect(seed.expiresAt, DateTime.parse(json['expiresAt']));
      });
    });
  });
}
