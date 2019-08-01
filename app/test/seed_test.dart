import 'package:qrgenerator/domain/models/seed.dart';
import 'package:qrgenerator/domain/models/serializers.dart';
import 'package:test/test.dart';

void main() {
  group('Seed', () {
    const String SEED = "8c0a6a843090e658a37a8f69c9843437";
    const String EXPIRES = "2019-07-31T15:12:42.684Z";

    test('seed should serialize and deserialize correctly', () {
      Seed original = Seed((b) {
        b.value = SEED;
        b.expiresAtStr = EXPIRES;
      });

      // Serialize the original and deserialize back.
      var serialized = serializers.serializeWith(Seed.serializer, original);
      Seed deserialized = serializers.deserializeWith(Seed.serializer, serialized);

      // They should be equal.
      expect(original, equals(deserialized));
    });

    test('seed should produce valid expiresAt date', () {
      Seed seed = Seed((b) {
        b.value = SEED;
        b.expiresAtStr = EXPIRES;
      });

      DateTime original = DateTime.parse(EXPIRES);
      DateTime expiresAt = seed.expiresAt;

      // They should be equal.
      expect(original, equals(expiresAt));
    });

    test('seed created in the past should be expired', () {
      // This seed is created with an expiresBy date in the past.
      Seed seed = Seed((b) {
        b.value = SEED;
        b.expiresAtStr = DateTime.now().add(Duration(days: -1)).toIso8601String();
      });

      // It should be expired.
      expect(seed.isExpired, equals(true));
    });

    test('seed created in the future should not be expired', () {
      // This seed is created with an expiresBy date in the future.
      Seed seed = Seed((b) {
        b.value = SEED;
        b.expiresAtStr = DateTime.now().add(Duration(days: 1)).toIso8601String();
      });

      // It should not be expired.
      expect(seed.isExpired, equals(false));
    });
  });
}
