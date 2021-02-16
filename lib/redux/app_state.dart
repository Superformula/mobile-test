import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code/model/seed.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @nullable @required Seed seed,
    @required bool isLoadingSeed,
    @required bool fetchSeedFailed,
  }) = _AppState;

  factory AppState.init() => AppState(seed: null, isLoadingSeed: false, fetchSeedFailed: false);
}
