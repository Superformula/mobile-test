// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'seed_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SeedDto _$SeedDtoFromJson(Map<String, dynamic> json) {
  return _SeedDto.fromJson(json);
}

/// @nodoc
class _$SeedDtoTearOff {
  const _$SeedDtoTearOff();

  _SeedDto call(
      {required String seed,
      @JsonKey(name: 'expires_at') required String expiresAt}) {
    return _SeedDto(
      seed: seed,
      expiresAt: expiresAt,
    );
  }

  SeedDto fromJson(Map<String, Object> json) {
    return SeedDto.fromJson(json);
  }
}

/// @nodoc
const $SeedDto = _$SeedDtoTearOff();

/// @nodoc
mixin _$SeedDto {
  String get seed => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  String get expiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeedDtoCopyWith<SeedDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeedDtoCopyWith<$Res> {
  factory $SeedDtoCopyWith(SeedDto value, $Res Function(SeedDto) then) =
      _$SeedDtoCopyWithImpl<$Res>;
  $Res call({String seed, @JsonKey(name: 'expires_at') String expiresAt});
}

/// @nodoc
class _$SeedDtoCopyWithImpl<$Res> implements $SeedDtoCopyWith<$Res> {
  _$SeedDtoCopyWithImpl(this._value, this._then);

  final SeedDto _value;
  // ignore: unused_field
  final $Res Function(SeedDto) _then;

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
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SeedDtoCopyWith<$Res> implements $SeedDtoCopyWith<$Res> {
  factory _$SeedDtoCopyWith(_SeedDto value, $Res Function(_SeedDto) then) =
      __$SeedDtoCopyWithImpl<$Res>;
  @override
  $Res call({String seed, @JsonKey(name: 'expires_at') String expiresAt});
}

/// @nodoc
class __$SeedDtoCopyWithImpl<$Res> extends _$SeedDtoCopyWithImpl<$Res>
    implements _$SeedDtoCopyWith<$Res> {
  __$SeedDtoCopyWithImpl(_SeedDto _value, $Res Function(_SeedDto) _then)
      : super(_value, (v) => _then(v as _SeedDto));

  @override
  _SeedDto get _value => super._value as _SeedDto;

  @override
  $Res call({
    Object? seed = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_SeedDto(
      seed: seed == freezed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SeedDto extends _SeedDto {
  const _$_SeedDto(
      {required this.seed,
      @JsonKey(name: 'expires_at') required this.expiresAt})
      : super._();

  factory _$_SeedDto.fromJson(Map<String, dynamic> json) =>
      _$_$_SeedDtoFromJson(json);

  @override
  final String seed;
  @override
  @JsonKey(name: 'expires_at')
  final String expiresAt;

  @override
  String toString() {
    return 'SeedDto(seed: $seed, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SeedDto &&
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
  _$SeedDtoCopyWith<_SeedDto> get copyWith =>
      __$SeedDtoCopyWithImpl<_SeedDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SeedDtoToJson(this);
  }
}

abstract class _SeedDto extends SeedDto {
  const factory _SeedDto(
      {required String seed,
      @JsonKey(name: 'expires_at') required String expiresAt}) = _$_SeedDto;
  const _SeedDto._() : super._();

  factory _SeedDto.fromJson(Map<String, dynamic> json) = _$_SeedDto.fromJson;

  @override
  String get seed => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'expires_at')
  String get expiresAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SeedDtoCopyWith<_SeedDto> get copyWith =>
      throw _privateConstructorUsedError;
}
