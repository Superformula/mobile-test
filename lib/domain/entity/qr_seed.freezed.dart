// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'qr_seed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QrSeedTearOff {
  const _$QrSeedTearOff();

  _QrSeed call({required String seed, required DateTime expiresAt}) {
    return _QrSeed(
      seed: seed,
      expiresAt: expiresAt,
    );
  }
}

/// @nodoc
const $QrSeed = _$QrSeedTearOff();

/// @nodoc
mixin _$QrSeed {
  String get seed => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QrSeedCopyWith<QrSeed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrSeedCopyWith<$Res> {
  factory $QrSeedCopyWith(QrSeed value, $Res Function(QrSeed) then) =
      _$QrSeedCopyWithImpl<$Res>;
  $Res call({String seed, DateTime expiresAt});
}

/// @nodoc
class _$QrSeedCopyWithImpl<$Res> implements $QrSeedCopyWith<$Res> {
  _$QrSeedCopyWithImpl(this._value, this._then);

  final QrSeed _value;
  // ignore: unused_field
  final $Res Function(QrSeed) _then;

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
abstract class _$QrSeedCopyWith<$Res> implements $QrSeedCopyWith<$Res> {
  factory _$QrSeedCopyWith(_QrSeed value, $Res Function(_QrSeed) then) =
      __$QrSeedCopyWithImpl<$Res>;
  @override
  $Res call({String seed, DateTime expiresAt});
}

/// @nodoc
class __$QrSeedCopyWithImpl<$Res> extends _$QrSeedCopyWithImpl<$Res>
    implements _$QrSeedCopyWith<$Res> {
  __$QrSeedCopyWithImpl(_QrSeed _value, $Res Function(_QrSeed) _then)
      : super(_value, (v) => _then(v as _QrSeed));

  @override
  _QrSeed get _value => super._value as _QrSeed;

  @override
  $Res call({
    Object? seed = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_QrSeed(
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

class _$_QrSeed implements _QrSeed {
  _$_QrSeed({required this.seed, required this.expiresAt});

  @override
  final String seed;
  @override
  final DateTime expiresAt;

  @override
  String toString() {
    return 'QrSeed(seed: $seed, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QrSeed &&
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
  _$QrSeedCopyWith<_QrSeed> get copyWith =>
      __$QrSeedCopyWithImpl<_QrSeed>(this, _$identity);
}

abstract class _QrSeed implements QrSeed {
  factory _QrSeed({required String seed, required DateTime expiresAt}) =
      _$_QrSeed;

  @override
  String get seed => throw _privateConstructorUsedError;
  @override
  DateTime get expiresAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QrSeedCopyWith<_QrSeed> get copyWith => throw _privateConstructorUsedError;
}
