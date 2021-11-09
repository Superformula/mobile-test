import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
part 'seed_model.g.dart';

@JsonSerializable()
@immutable
class SeedModel {
  const SeedModel({
    required this.id,
    required this.expiresAt,
  });

  final String id;
  final DateTime expiresAt;

  factory SeedModel.fromJson(Map<String, dynamic> data) =>
      _$SeedModelFromJson(data);

  Map<String, dynamic> toJson() => _$SeedModelToJson(this);
}
