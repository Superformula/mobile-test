import 'package:json_annotation/json_annotation.dart';
part 'seed_model.g.dart';

@JsonSerializable()
class SeedDto {
  final String? seed;
  final DateTime? expiration;

  SeedDto({required this.seed, required this.expiration});

  factory SeedDto.fromJson(Map<String, dynamic> json) =>
      _$SeedDtoFromJson(json);
}
