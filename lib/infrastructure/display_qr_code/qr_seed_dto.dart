import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/entities/qr_seed.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_data.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_expiration_date.dart';

part 'qr_seed_dto.freezed.dart';
part 'qr_seed_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false)
abstract class QrSeedDto with _$QrSeedDto {
  const factory QrSeedDto({
    required String seed,
    @JsonKey(name: 'expires_at') required String expiresAt,
  }) = _QrSeedDto;

  const QrSeedDto._();

  QrSeed toDomain() {
    return QrSeed(
        seed: QrSeedData(seed),
        expiresAt: QrSeedExpirationDate.withString(expiresAt));
  }

  factory QrSeedDto.fromDomain(QrSeed qrSeed) {
    return QrSeedDto(
      seed: qrSeed.seed.getOrCrash(),
      expiresAt: qrSeed.expiresAt.getOrCrash().toIso8601String(),
    );
  }

  @override
  Map<String, dynamic> toJson() => _$QrSeedDtoToJson(this);

  factory QrSeedDto.fromJson(Map<String, dynamic> json) =>
      _$QrSeedDtoFromJson(json);
}
