import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qrtestcodeone/domain/entity/qr_seed.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///
part 'qr_seed_datamodel.g.dart';

@JsonSerializable()
class QrSeedDataModel extends Equatable {
  final String seed;
  @JsonKey(name: 'expires_at')
  final DateTime expiresAt;

  QrSeedDataModel(this.seed, this.expiresAt);

  QrSeed toQrSeed() => QrSeed(seed: seed, expiresAt: expiresAt);

  factory QrSeedDataModel.fromJson(Map<String, dynamic> json) =>
      _$QrSeedDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$QrSeedDataModelToJson(this);

  @override
  List<Object?> get props => [seed, expiresAt];
}
