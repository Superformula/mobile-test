import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:supercode/models.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AppState._();
  factory AppState([updates(AppStateBuilder b)]) = _$AppState;
  factory AppState.initial() {
    return AppState((b) => b..loading = false);
  }

  bool get loading;

  @nullable
  Seed get activeSeed;

  @nullable
  Timer get timer;
}
