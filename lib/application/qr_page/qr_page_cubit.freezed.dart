// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'qr_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QrPageStateTearOff {
  const _$QrPageStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _Loaded loaded({required Seed seed, required int ttl}) {
    return _Loaded(
      seed: seed,
      ttl: ttl,
    );
  }

  _LoadError loadError({required CommonFailure failure}) {
    return _LoadError(
      failure: failure,
    );
  }
}

/// @nodoc
const $QrPageState = _$QrPageStateTearOff();

/// @nodoc
mixin _$QrPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Seed seed, int ttl) loaded,
    required TResult Function(CommonFailure failure) loadError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Seed seed, int ttl)? loaded,
    TResult Function(CommonFailure failure)? loadError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadError value) loadError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadError value)? loadError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrPageStateCopyWith<$Res> {
  factory $QrPageStateCopyWith(
          QrPageState value, $Res Function(QrPageState) then) =
      _$QrPageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$QrPageStateCopyWithImpl<$Res> implements $QrPageStateCopyWith<$Res> {
  _$QrPageStateCopyWithImpl(this._value, this._then);

  final QrPageState _value;
  // ignore: unused_field
  final $Res Function(QrPageState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$QrPageStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'QrPageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Seed seed, int ttl) loaded,
    required TResult Function(CommonFailure failure) loadError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Seed seed, int ttl)? loaded,
    TResult Function(CommonFailure failure)? loadError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadError value) loadError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadError value)? loadError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements QrPageState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  $Res call({Seed seed, int ttl});

  $SeedCopyWith<$Res> get seed;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$QrPageStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? seed = freezed,
    Object? ttl = freezed,
  }) {
    return _then(_Loaded(
      seed: seed == freezed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as Seed,
      ttl: ttl == freezed
          ? _value.ttl
          : ttl // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $SeedCopyWith<$Res> get seed {
    return $SeedCopyWith<$Res>(_value.seed, (value) {
      return _then(_value.copyWith(seed: value));
    });
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({required this.seed, required this.ttl});

  @override
  final Seed seed;
  @override
  final int ttl;

  @override
  String toString() {
    return 'QrPageState.loaded(seed: $seed, ttl: $ttl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded &&
            (identical(other.seed, seed) ||
                const DeepCollectionEquality().equals(other.seed, seed)) &&
            (identical(other.ttl, ttl) ||
                const DeepCollectionEquality().equals(other.ttl, ttl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(seed) ^
      const DeepCollectionEquality().hash(ttl);

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Seed seed, int ttl) loaded,
    required TResult Function(CommonFailure failure) loadError,
  }) {
    return loaded(seed, ttl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Seed seed, int ttl)? loaded,
    TResult Function(CommonFailure failure)? loadError,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(seed, ttl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadError value) loadError,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadError value)? loadError,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements QrPageState {
  const factory _Loaded({required Seed seed, required int ttl}) = _$_Loaded;

  Seed get seed => throw _privateConstructorUsedError;
  int get ttl => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadErrorCopyWith<$Res> {
  factory _$LoadErrorCopyWith(
          _LoadError value, $Res Function(_LoadError) then) =
      __$LoadErrorCopyWithImpl<$Res>;
  $Res call({CommonFailure failure});

  $CommonFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$LoadErrorCopyWithImpl<$Res> extends _$QrPageStateCopyWithImpl<$Res>
    implements _$LoadErrorCopyWith<$Res> {
  __$LoadErrorCopyWithImpl(_LoadError _value, $Res Function(_LoadError) _then)
      : super(_value, (v) => _then(v as _LoadError));

  @override
  _LoadError get _value => super._value as _LoadError;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_LoadError(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as CommonFailure,
    ));
  }

  @override
  $CommonFailureCopyWith<$Res> get failure {
    return $CommonFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_LoadError implements _LoadError {
  const _$_LoadError({required this.failure});

  @override
  final CommonFailure failure;

  @override
  String toString() {
    return 'QrPageState.loadError(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadError &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$LoadErrorCopyWith<_LoadError> get copyWith =>
      __$LoadErrorCopyWithImpl<_LoadError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Seed seed, int ttl) loaded,
    required TResult Function(CommonFailure failure) loadError,
  }) {
    return loadError(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Seed seed, int ttl)? loaded,
    TResult Function(CommonFailure failure)? loadError,
    required TResult orElse(),
  }) {
    if (loadError != null) {
      return loadError(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadError value) loadError,
  }) {
    return loadError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadError value)? loadError,
    required TResult orElse(),
  }) {
    if (loadError != null) {
      return loadError(this);
    }
    return orElse();
  }
}

abstract class _LoadError implements QrPageState {
  const factory _LoadError({required CommonFailure failure}) = _$_LoadError;

  CommonFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadErrorCopyWith<_LoadError> get copyWith =>
      throw _privateConstructorUsedError;
}
