// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'seed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SeedTearOff {
  const _$SeedTearOff();

  _Seed call({required String seed, required DateTime expiresAt}) {
    return _Seed(
      seed: seed,
      expiresAt: expiresAt,
    );
  }
}

/// @nodoc
const $Seed = _$SeedTearOff();

/// @nodoc
mixin _$Seed {
  String get seed => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeedCopyWith<Seed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeedCopyWith<$Res> {
  factory $SeedCopyWith(Seed value, $Res Function(Seed) then) =
      _$SeedCopyWithImpl<$Res>;
  $Res call({String seed, DateTime expiresAt});
}

/// @nodoc
class _$SeedCopyWithImpl<$Res> implements $SeedCopyWith<$Res> {
  _$SeedCopyWithImpl(this._value, this._then);

  final Seed _value;
  // ignore: unused_field
  final $Res Function(Seed) _then;

  @override
  $Res call({
    Object? seed = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      seed: seed == freezed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$SeedCopyWith<$Res> implements $SeedCopyWith<$Res> {
  factory _$SeedCopyWith(_Seed value, $Res Function(_Seed) then) =
      __$SeedCopyWithImpl<$Res>;
  @override
  $Res call({String seed, DateTime expiresAt});
}

/// @nodoc
class __$SeedCopyWithImpl<$Res> extends _$SeedCopyWithImpl<$Res>
    implements _$SeedCopyWith<$Res> {
  __$SeedCopyWithImpl(_Seed _value, $Res Function(_Seed) _then)
      : super(_value, (v) => _then(v as _Seed));

  @override
  _Seed get _value => super._value as _Seed;

  @override
  $Res call({
    Object? seed = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_Seed(
      seed: seed == freezed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Seed extends _Seed {
  const _$_Seed({required this.seed, required this.expiresAt}) : super._();

  @override
  final String seed;
  @override
  final DateTime expiresAt;

  @override
  String toString() {
    return 'Seed(seed: $seed, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Seed &&
            (identical(other.seed, seed) ||
                const DeepCollectionEquality().equals(other.seed, seed)) &&
            (identical(other.expiresAt, expiresAt) ||
                const DeepCollectionEquality()
                    .equals(other.expiresAt, expiresAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(seed) ^
      const DeepCollectionEquality().hash(expiresAt);

  @JsonKey(ignore: true)
  @override
  _$SeedCopyWith<_Seed> get copyWith =>
      __$SeedCopyWithImpl<_Seed>(this, _$identity);
}

abstract class _Seed extends Seed {
  const factory _Seed({required String seed, required DateTime expiresAt}) =
      _$_Seed;
  const _Seed._() : super._();

  @override
  String get seed => throw _privateConstructorUsedError;
  @override
  DateTime get expiresAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SeedCopyWith<_Seed> get copyWith => throw _privateConstructorUsedError;
}
