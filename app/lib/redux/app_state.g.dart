// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final bool loading;
  @override
  final int timerDurationSeconds;
  @override
  final Seed activeSeed;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.loading, this.timerDurationSeconds, this.activeSeed})
      : super._() {
    if (loading == null) {
      throw new BuiltValueNullFieldError('AppState', 'loading');
    }
    if (timerDurationSeconds == null) {
      throw new BuiltValueNullFieldError('AppState', 'timerDurationSeconds');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        loading == other.loading &&
        timerDurationSeconds == other.timerDurationSeconds &&
        activeSeed == other.activeSeed;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, loading.hashCode), timerDurationSeconds.hashCode),
        activeSeed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('loading', loading)
          ..add('timerDurationSeconds', timerDurationSeconds)
          ..add('activeSeed', activeSeed))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  bool _loading;
  bool get loading => _$this._loading;
  set loading(bool loading) => _$this._loading = loading;

  int _timerDurationSeconds;
  int get timerDurationSeconds => _$this._timerDurationSeconds;
  set timerDurationSeconds(int timerDurationSeconds) =>
      _$this._timerDurationSeconds = timerDurationSeconds;

  Seed _activeSeed;
  Seed get activeSeed => _$this._activeSeed;
  set activeSeed(Seed activeSeed) => _$this._activeSeed = activeSeed;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _loading = _$v.loading;
      _timerDurationSeconds = _$v.timerDurationSeconds;
      _activeSeed = _$v.activeSeed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    final _$result = _$v ??
        new _$AppState._(
            loading: loading,
            timerDurationSeconds: timerDurationSeconds,
            activeSeed: activeSeed);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
