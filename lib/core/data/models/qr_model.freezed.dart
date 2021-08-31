// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'qr_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QrModel _$QrModelFromJson(Map<String, dynamic> json) {
  return _QrModel.fromJson(json);
}

/// @nodoc
class _$QrModelTearOff {
  const _$QrModelTearOff();

  _QrModel call({String? seed, String? expiresAt}) {
    return _QrModel(
      seed: seed,
      expiresAt: expiresAt,
    );
  }

  QrModel fromJson(Map<String, Object> json) {
    return QrModel.fromJson(json);
  }
}

/// @nodoc
const $QrModel = _$QrModelTearOff();

/// @nodoc
mixin _$QrModel {
  String? get seed => throw _privateConstructorUsedError;
  String? get expiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QrModelCopyWith<QrModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrModelCopyWith<$Res> {
  factory $QrModelCopyWith(QrModel value, $Res Function(QrModel) then) =
      _$QrModelCopyWithImpl<$Res>;
  $Res call({String? seed, String? expiresAt});
}

/// @nodoc
class _$QrModelCopyWithImpl<$Res> implements $QrModelCopyWith<$Res> {
  _$QrModelCopyWithImpl(this._value, this._then);

  final QrModel _value;
  // ignore: unused_field
  final $Res Function(QrModel) _then;

  @override
  $Res call({
    Object? seed = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      seed: seed == freezed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$QrModelCopyWith<$Res> implements $QrModelCopyWith<$Res> {
  factory _$QrModelCopyWith(_QrModel value, $Res Function(_QrModel) then) =
      __$QrModelCopyWithImpl<$Res>;
  @override
  $Res call({String? seed, String? expiresAt});
}

/// @nodoc
class __$QrModelCopyWithImpl<$Res> extends _$QrModelCopyWithImpl<$Res>
    implements _$QrModelCopyWith<$Res> {
  __$QrModelCopyWithImpl(_QrModel _value, $Res Function(_QrModel) _then)
      : super(_value, (v) => _then(v as _QrModel));

  @override
  _QrModel get _value => super._value as _QrModel;

  @override
  $Res call({
    Object? seed = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_QrModel(
      seed: seed == freezed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QrModel extends _QrModel {
  const _$_QrModel({this.seed, this.expiresAt}) : super._();

  factory _$_QrModel.fromJson(Map<String, dynamic> json) =>
      _$_$_QrModelFromJson(json);

  @override
  final String? seed;
  @override
  final String? expiresAt;

  @override
  String toString() {
    return 'QrModel(seed: $seed, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QrModel &&
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
  _$QrModelCopyWith<_QrModel> get copyWith =>
      __$QrModelCopyWithImpl<_QrModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QrModelToJson(this);
  }
}

abstract class _QrModel extends QrModel {
  const factory _QrModel({String? seed, String? expiresAt}) = _$_QrModel;
  const _QrModel._() : super._();

  factory _QrModel.fromJson(Map<String, dynamic> json) = _$_QrModel.fromJson;

  @override
  String? get seed => throw _privateConstructorUsedError;
  @override
  String? get expiresAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QrModelCopyWith<_QrModel> get copyWith =>
      throw _privateConstructorUsedError;
}
