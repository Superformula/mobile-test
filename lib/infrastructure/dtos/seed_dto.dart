import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_generator/domain/seed.dart';

part 'seed_dto.freezed.dart';
part 'seed_dto.g.dart';

@freezed
class SeedDto with _$SeedDto {
  const SeedDto._();

  const factory SeedDto({
    required String seed,
    @JsonKey(name: 'expires_at') required String expiresAt,
  }) = _SeedDto;

  Seed toDomain() {
    return Seed(seed: seed, expiresAt: DateTime.parse(expiresAt));
  }

  factory SeedDto.fromJson(Map<String, dynamic> json) =>
      _$SeedDtoFromJson(json);
}
