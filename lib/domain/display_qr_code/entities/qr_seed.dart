import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_data.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_expiration_date.dart';

part 'qr_seed.freezed.dart';

@freezed
abstract class QrSeed with _$QrSeed {
  const factory QrSeed({
    required QrSeedData data,
    required QrSeedExpirationDate expireDate,
  }) = _QrSeed;
}
