// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final bool loading;
  @override
  final Seed activeSeed;
  @override
  final Timer timer;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.loading, this.activeSeed, this.timer}) : super._() {
    if (loading == null) {
      throw new BuiltValueNullFieldError('AppState', 'loading');
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
        activeSeed == other.activeSeed &&
        timer == other.timer;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, loading.hashCode), activeSeed.hashCode), timer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('loading', loading)
          ..add('activeSeed', activeSeed)
          ..add('timer', timer))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  bool _loading;
  bool get loading => _$this._loading;
  set loading(bool loading) => _$this._loading = loading;

  Seed _activeSeed;
  Seed get activeSeed => _$this._activeSeed;
  set activeSeed(Seed activeSeed) => _$this._activeSeed = activeSeed;

  Timer _timer;
  Timer get timer => _$this._timer;
  set timer(Timer timer) => _$this._timer = timer;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _loading = _$v.loading;
      _activeSeed = _$v.activeSeed;
      _timer = _$v.timer;
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
            loading: loading, activeSeed: activeSeed, timer: timer);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
