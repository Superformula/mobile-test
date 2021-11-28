import 'package:freezed_annotation/freezed_annotation.dart';

part 'seed.g.dart';

@JsonSerializable(createToJson: false)
class Seed {
  final String seed;
  @JsonKey(name: "expires_at")
  final DateTime expiresAt;

  Seed(this.seed, this.expiresAt);

  factory Seed.fromJson(final Map<String, dynamic> json) =>
      _$SeedFromJson(json);
}
