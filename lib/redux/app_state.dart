import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code/model/seed.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @required SeedState seedState,
    @required ValidationState validationState,
  }) = _AppState;

  factory AppState.init() => AppState(
        seedState: SeedState.idle(),
        validationState: ValidationState.idle(),
      );
}

@freezed
abstract class SeedState with _$SeedState {
  const factory SeedState.idle() = Idle;

  const factory SeedState.inProgress() = InProgress;

  const factory SeedState.loaded(Seed seed) = Loaded;

  const factory SeedState.error() = Error;
}

@freezed
abstract class ValidationState with _$ValidationState {
  const factory ValidationState.idle() = ValidationIdle;

  const factory ValidationState.inProgress() = ValidationInProgress;

  const factory ValidationState.validCode() = ValidCode;

  const factory ValidationState.expiredCode() = ExpiredCode;

  const factory ValidationState.error() = ValidationError;
}
