import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/domain.dart' show Seed;

part 'seed_model.g.dart';

/// `SeedModel` used for handling JSON from/to parsing
/// for easiser communication with api

@JsonSerializable()
class SeedModel extends Seed {
  /// Generate an intance of `Seed` with form/to json capability
  SeedModel({
    @required String seed,
    @required DateTime expiresAt,
  }) : super(
          seed: seed,
          expiresAt: expiresAt,
        );

  ///Return `SeedModel` instance from a json map
  factory SeedModel.fromJson(Map<String, dynamic> json) =>
      _$SeedModelFromJson(json);

  /// Return `Map<String, dynamic>` representation of `SeedModel`
  Map<String, dynamic> toJson() => _$SeedModelToJson(this);

  @override
  List<Object> get props => [
        seed,
        expiresAt,
      ];

  @override
  bool get stringify => true;
}
