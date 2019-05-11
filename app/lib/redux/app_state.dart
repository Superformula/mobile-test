import 'package:built_value/built_value.dart';
import 'package:supercode/models.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AppState._();
  factory AppState([updates(AppStateBuilder b)]) = _$AppState;
  factory AppState.initial() {
    return AppState((b) => b
      ..loading = false
      ..validating = false
      ..timerDurationSeconds = 0);
  }

  /// If a QR code is being loading
  bool get loading;

  /// If a QR code is being validated
  bool get validating;

  /// If a code is valid
  @nullable
  bool get codeIsValid;

  /// Time in seconds that the current [activeSeed] is valid for
  int get timerDurationSeconds;

  /// The active [Seed] being displayed to the user
  @nullable
  Seed get activeSeed;
}
