import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';
import 'package:test/test.dart';

void main() {
  group("Seed", () {
    test("Making sure that 'Seed' instances are properly compared", () {
      final seed1 = Seed.fromJson({
        "seed": "abc",
        "expires_at": "123"
      });

      final seed2 = Seed.fromJson({
        "seed": "def",
        "expires_at": "123"
      });

      expect(seed1, equals(Seed.fromJson({
        "seed": "abc",
        "expires_at": "123"
      })));

      expect(seed1 == seed2, isFalse);
      expect(seed1 != seed2, isTrue);
    });

    test("Making sure that a 'Seed' is properly built", () {
      final seed = Seed.fromJson({
        "seed": "abc",
        "expires_at": "123"
      });

      expect(seed.seed, equals("abc"));
      expect(seed.expiryDate, equals("123"));

      expect(seed.toJson(), equals({
        "seed": "abc",
        "expires_at": "123"
      }));
    });
  });
}