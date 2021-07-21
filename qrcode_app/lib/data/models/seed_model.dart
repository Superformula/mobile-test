import 'package:json_annotation/json_annotation.dart';
part 'seed_model.g.dart';

@JsonSerializable()
class SeedDto {
  final String? seed;
  final DateTime? expiration;
  final int? duration;

  SeedDto(
      {required this.duration, required this.seed, required this.expiration});

  factory SeedDto.fromJson(Map<String, dynamic> json) =>
      _$SeedDtoFromJson(json);
}
