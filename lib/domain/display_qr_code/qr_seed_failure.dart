import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_seed_failure.freezed.dart';

@freezed
abstract class QrSeedFailure with _$QrSeedFailure {
  const factory QrSeedFailure.unexpected() = _QrSeedUnexpectedFailure;
  const factory QrSeedFailure.serverFailure() = _QrSeedServerFailure;
  const factory QrSeedFailure.cacheFailure() = _QrSeedFailure;
}
