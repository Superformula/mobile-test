// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'scan_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ScanPageStateTearOff {
  const _$ScanPageStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _CodeScanned seedScanned({required String code}) {
    return _CodeScanned(
      code: code,
    );
  }

  _SeedVerified seedVerified({required String code}) {
    return _SeedVerified(
      code: code,
    );
  }

  _SeedInvalid seedInvalid() {
    return const _SeedInvalid();
  }
}

/// @nodoc
const $ScanPageState = _$ScanPageStateTearOff();

/// @nodoc
mixin _$ScanPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String code) seedScanned,
    required TResult Function(String code) seedVerified,
    required TResult Function() seedInvalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String code)? seedScanned,
    TResult Function(String code)? seedVerified,
    TResult Function()? seedInvalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CodeScanned value) seedScanned,
    required TResult Function(_SeedVerified value) seedVerified,
    required TResult Function(_SeedInvalid value) seedInvalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CodeScanned value)? seedScanned,
    TResult Function(_SeedVerified value)? seedVerified,
    TResult Function(_SeedInvalid value)? seedInvalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanPageStateCopyWith<$Res> {
  factory $ScanPageStateCopyWith(
          ScanPageState value, $Res Function(ScanPageState) then) =
      _$ScanPageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ScanPageStateCopyWithImpl<$Res>
    implements $ScanPageStateCopyWith<$Res> {
  _$ScanPageStateCopyWithImpl(this._value, this._then);

  final ScanPageState _value;
  // ignore: unused_field
  final $Res Function(ScanPageState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$ScanPageStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ScanPageState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String code) seedScanned,
    required TResult Function(String code) seedVerified,
    required TResult Function() seedInvalid,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String code)? seedScanned,
    TResult Function(String code)? seedVerified,
    TResult Function()? seedInvalid,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CodeScanned value) seedScanned,
    required TResult Function(_SeedVerified value) seedVerified,
    required TResult Function(_SeedInvalid value) seedInvalid,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CodeScanned value)? seedScanned,
    TResult Function(_SeedVerified value)? seedVerified,
    TResult Function(_SeedInvalid value)? seedInvalid,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ScanPageState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$CodeScannedCopyWith<$Res> {
  factory _$CodeScannedCopyWith(
          _CodeScanned value, $Res Function(_CodeScanned) then) =
      __$CodeScannedCopyWithImpl<$Res>;
  $Res call({String code});
}

/// @nodoc
class __$CodeScannedCopyWithImpl<$Res> extends _$ScanPageStateCopyWithImpl<$Res>
    implements _$CodeScannedCopyWith<$Res> {
  __$CodeScannedCopyWithImpl(
      _CodeScanned _value, $Res Function(_CodeScanned) _then)
      : super(_value, (v) => _then(v as _CodeScanned));

  @override
  _CodeScanned get _value => super._value as _CodeScanned;

  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_CodeScanned(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CodeScanned implements _CodeScanned {
  const _$_CodeScanned({required this.code});

  @override
  final String code;

  @override
  String toString() {
    return 'ScanPageState.seedScanned(code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CodeScanned &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$CodeScannedCopyWith<_CodeScanned> get copyWith =>
      __$CodeScannedCopyWithImpl<_CodeScanned>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String code) seedScanned,
    required TResult Function(String code) seedVerified,
    required TResult Function() seedInvalid,
  }) {
    return seedScanned(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String code)? seedScanned,
    TResult Function(String code)? seedVerified,
    TResult Function()? seedInvalid,
    required TResult orElse(),
  }) {
    if (seedScanned != null) {
      return seedScanned(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CodeScanned value) seedScanned,
    required TResult Function(_SeedVerified value) seedVerified,
    required TResult Function(_SeedInvalid value) seedInvalid,
  }) {
    return seedScanned(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CodeScanned value)? seedScanned,
    TResult Function(_SeedVerified value)? seedVerified,
    TResult Function(_SeedInvalid value)? seedInvalid,
    required TResult orElse(),
  }) {
    if (seedScanned != null) {
      return seedScanned(this);
    }
    return orElse();
  }
}

abstract class _CodeScanned implements ScanPageState {
  const factory _CodeScanned({required String code}) = _$_CodeScanned;

  String get code => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$CodeScannedCopyWith<_CodeScanned> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SeedVerifiedCopyWith<$Res> {
  factory _$SeedVerifiedCopyWith(
          _SeedVerified value, $Res Function(_SeedVerified) then) =
      __$SeedVerifiedCopyWithImpl<$Res>;
  $Res call({String code});
}

/// @nodoc
class __$SeedVerifiedCopyWithImpl<$Res>
    extends _$ScanPageStateCopyWithImpl<$Res>
    implements _$SeedVerifiedCopyWith<$Res> {
  __$SeedVerifiedCopyWithImpl(
      _SeedVerified _value, $Res Function(_SeedVerified) _then)
      : super(_value, (v) => _then(v as _SeedVerified));

  @override
  _SeedVerified get _value => super._value as _SeedVerified;

  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_SeedVerified(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SeedVerified implements _SeedVerified {
  const _$_SeedVerified({required this.code});

  @override
  final String code;

  @override
  String toString() {
    return 'ScanPageState.seedVerified(code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SeedVerified &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$SeedVerifiedCopyWith<_SeedVerified> get copyWith =>
      __$SeedVerifiedCopyWithImpl<_SeedVerified>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String code) seedScanned,
    required TResult Function(String code) seedVerified,
    required TResult Function() seedInvalid,
  }) {
    return seedVerified(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String code)? seedScanned,
    TResult Function(String code)? seedVerified,
    TResult Function()? seedInvalid,
    required TResult orElse(),
  }) {
    if (seedVerified != null) {
      return seedVerified(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CodeScanned value) seedScanned,
    required TResult Function(_SeedVerified value) seedVerified,
    required TResult Function(_SeedInvalid value) seedInvalid,
  }) {
    return seedVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CodeScanned value)? seedScanned,
    TResult Function(_SeedVerified value)? seedVerified,
    TResult Function(_SeedInvalid value)? seedInvalid,
    required TResult orElse(),
  }) {
    if (seedVerified != null) {
      return seedVerified(this);
    }
    return orElse();
  }
}

abstract class _SeedVerified implements ScanPageState {
  const factory _SeedVerified({required String code}) = _$_SeedVerified;

  String get code => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SeedVerifiedCopyWith<_SeedVerified> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SeedInvalidCopyWith<$Res> {
  factory _$SeedInvalidCopyWith(
          _SeedInvalid value, $Res Function(_SeedInvalid) then) =
      __$SeedInvalidCopyWithImpl<$Res>;
}

/// @nodoc
class __$SeedInvalidCopyWithImpl<$Res> extends _$ScanPageStateCopyWithImpl<$Res>
    implements _$SeedInvalidCopyWith<$Res> {
  __$SeedInvalidCopyWithImpl(
      _SeedInvalid _value, $Res Function(_SeedInvalid) _then)
      : super(_value, (v) => _then(v as _SeedInvalid));

  @override
  _SeedInvalid get _value => super._value as _SeedInvalid;
}

/// @nodoc

class _$_SeedInvalid implements _SeedInvalid {
  const _$_SeedInvalid();

  @override
  String toString() {
    return 'ScanPageState.seedInvalid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SeedInvalid);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String code) seedScanned,
    required TResult Function(String code) seedVerified,
    required TResult Function() seedInvalid,
  }) {
    return seedInvalid();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String code)? seedScanned,
    TResult Function(String code)? seedVerified,
    TResult Function()? seedInvalid,
    required TResult orElse(),
  }) {
    if (seedInvalid != null) {
      return seedInvalid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CodeScanned value) seedScanned,
    required TResult Function(_SeedVerified value) seedVerified,
    required TResult Function(_SeedInvalid value) seedInvalid,
  }) {
    return seedInvalid(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CodeScanned value)? seedScanned,
    TResult Function(_SeedVerified value)? seedVerified,
    TResult Function(_SeedInvalid value)? seedInvalid,
    required TResult orElse(),
  }) {
    if (seedInvalid != null) {
      return seedInvalid(this);
    }
    return orElse();
  }
}

abstract class _SeedInvalid implements ScanPageState {
  const factory _SeedInvalid() = _$_SeedInvalid;
}
