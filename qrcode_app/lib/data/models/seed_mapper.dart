import 'package:qrcode_app/data/models/seed_model.dart';
import 'package:qrcode_app/domain/entities/seed.dart';

class SeedMapper {
  Seed toSeed(SeedDto dto) => Seed(
      seed: dto.seed ?? 'default',
      expirationDate:
          dto.expiration ?? DateTime.now().add(Duration(seconds: 100)));

  SeedDto toDto(Seed seed) =>
      SeedDto(seed: seed.seed, expiration: seed.expirationDate);
}
