import 'package:qrcode_app/data/models/seed_model.dart';
import 'package:qrcode_app/domain/entities/seed.dart';

class SeedMapper {
  Seed toSeed(SeedDto dto) =>
      Seed(seed: dto.seed, expirationDate: dto.expirationDate);

  SeedDto toDto(Seed seed) => SeedDto(seed.seed, seed.expirationDate);
}
