import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/seed.dart';

part 'seed_model.g.dart';

///
/// * [SeedModel]
///
@JsonSerializable()
class SeedModel extends Seed {
  /// Implements all the JSON (de)serialization methods for a [Seed].
  SeedModel({
    @required String seed,
    @required DateTime expiresAt,
  }) : super(seed: seed, expiresAt: expiresAt);

  /// JSON deserializer constructor.
  factory SeedModel.fromJson(Map<String, dynamic> json) {
    return _$SeedModelFromJson(json);
  }

  /// JSON serializer method.
  Map<String, dynamic> toJson() => _$SeedModelToJson(this);
}
