import 'package:qrgenerator/domain/models/seed.dart';
import 'package:qrgenerator/domain/models/serializers.dart';
import 'package:test/test.dart';

void main() {
  group('Counter', () {
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
  });
}
