// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeEventTearOff {
  const _$HomeEventTearOff();

  _generateQrCode generateQrCode() {
    return const _generateQrCode();
  }

  _scanQrCode scanQrCode() {
    return const _scanQrCode();
  }

  _handleScannedQrCode handleScannedQrCode(String qrCode) {
    return _handleScannedQrCode(
      qrCode,
    );
  }
}

/// @nodoc
const $HomeEvent = _$HomeEventTearOff();

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateQrCode,
    required TResult Function() scanQrCode,
    required TResult Function(String qrCode) handleScannedQrCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateQrCode,
    TResult Function()? scanQrCode,
    TResult Function(String qrCode)? handleScannedQrCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_generateQrCode value) generateQrCode,
    required TResult Function(_scanQrCode value) scanQrCode,
    required TResult Function(_handleScannedQrCode value) handleScannedQrCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_generateQrCode value)? generateQrCode,
    TResult Function(_scanQrCode value)? scanQrCode,
    TResult Function(_handleScannedQrCode value)? handleScannedQrCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class _$generateQrCodeCopyWith<$Res> {
  factory _$generateQrCodeCopyWith(
          _generateQrCode value, $Res Function(_generateQrCode) then) =
      __$generateQrCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$generateQrCodeCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements _$generateQrCodeCopyWith<$Res> {
  __$generateQrCodeCopyWithImpl(
      _generateQrCode _value, $Res Function(_generateQrCode) _then)
      : super(_value, (v) => _then(v as _generateQrCode));

  @override
  _generateQrCode get _value => super._value as _generateQrCode;
}

/// @nodoc

class _$_generateQrCode implements _generateQrCode {
  const _$_generateQrCode();

  @override
  String toString() {
    return 'HomeEvent.generateQrCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _generateQrCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateQrCode,
    required TResult Function() scanQrCode,
    required TResult Function(String qrCode) handleScannedQrCode,
  }) {
    return generateQrCode();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateQrCode,
    TResult Function()? scanQrCode,
    TResult Function(String qrCode)? handleScannedQrCode,
    required TResult orElse(),
  }) {
    if (generateQrCode != null) {
      return generateQrCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_generateQrCode value) generateQrCode,
    required TResult Function(_scanQrCode value) scanQrCode,
    required TResult Function(_handleScannedQrCode value) handleScannedQrCode,
  }) {
    return generateQrCode(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_generateQrCode value)? generateQrCode,
    TResult Function(_scanQrCode value)? scanQrCode,
    TResult Function(_handleScannedQrCode value)? handleScannedQrCode,
    required TResult orElse(),
  }) {
    if (generateQrCode != null) {
      return generateQrCode(this);
    }
    return orElse();
  }
}

abstract class _generateQrCode implements HomeEvent {
  const factory _generateQrCode() = _$_generateQrCode;
}

/// @nodoc
abstract class _$scanQrCodeCopyWith<$Res> {
  factory _$scanQrCodeCopyWith(
          _scanQrCode value, $Res Function(_scanQrCode) then) =
      __$scanQrCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$scanQrCodeCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements _$scanQrCodeCopyWith<$Res> {
  __$scanQrCodeCopyWithImpl(
      _scanQrCode _value, $Res Function(_scanQrCode) _then)
      : super(_value, (v) => _then(v as _scanQrCode));

  @override
  _scanQrCode get _value => super._value as _scanQrCode;
}

/// @nodoc

class _$_scanQrCode implements _scanQrCode {
  const _$_scanQrCode();

  @override
  String toString() {
    return 'HomeEvent.scanQrCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _scanQrCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateQrCode,
    required TResult Function() scanQrCode,
    required TResult Function(String qrCode) handleScannedQrCode,
  }) {
    return scanQrCode();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateQrCode,
    TResult Function()? scanQrCode,
    TResult Function(String qrCode)? handleScannedQrCode,
    required TResult orElse(),
  }) {
    if (scanQrCode != null) {
      return scanQrCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_generateQrCode value) generateQrCode,
    required TResult Function(_scanQrCode value) scanQrCode,
    required TResult Function(_handleScannedQrCode value) handleScannedQrCode,
  }) {
    return scanQrCode(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_generateQrCode value)? generateQrCode,
    TResult Function(_scanQrCode value)? scanQrCode,
    TResult Function(_handleScannedQrCode value)? handleScannedQrCode,
    required TResult orElse(),
  }) {
    if (scanQrCode != null) {
      return scanQrCode(this);
    }
    return orElse();
  }
}

abstract class _scanQrCode implements HomeEvent {
  const factory _scanQrCode() = _$_scanQrCode;
}

/// @nodoc
abstract class _$handleScannedQrCodeCopyWith<$Res> {
  factory _$handleScannedQrCodeCopyWith(_handleScannedQrCode value,
          $Res Function(_handleScannedQrCode) then) =
      __$handleScannedQrCodeCopyWithImpl<$Res>;
  $Res call({String qrCode});
}

/// @nodoc
class __$handleScannedQrCodeCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements _$handleScannedQrCodeCopyWith<$Res> {
  __$handleScannedQrCodeCopyWithImpl(
      _handleScannedQrCode _value, $Res Function(_handleScannedQrCode) _then)
      : super(_value, (v) => _then(v as _handleScannedQrCode));

  @override
  _handleScannedQrCode get _value => super._value as _handleScannedQrCode;

  @override
  $Res call({
    Object? qrCode = freezed,
  }) {
    return _then(_handleScannedQrCode(
      qrCode == freezed
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_handleScannedQrCode implements _handleScannedQrCode {
  const _$_handleScannedQrCode(this.qrCode);

  @override
  final String qrCode;

  @override
  String toString() {
    return 'HomeEvent.handleScannedQrCode(qrCode: $qrCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _handleScannedQrCode &&
            (identical(other.qrCode, qrCode) ||
                const DeepCollectionEquality().equals(other.qrCode, qrCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(qrCode);

  @JsonKey(ignore: true)
  @override
  _$handleScannedQrCodeCopyWith<_handleScannedQrCode> get copyWith =>
      __$handleScannedQrCodeCopyWithImpl<_handleScannedQrCode>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateQrCode,
    required TResult Function() scanQrCode,
    required TResult Function(String qrCode) handleScannedQrCode,
  }) {
    return handleScannedQrCode(qrCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateQrCode,
    TResult Function()? scanQrCode,
    TResult Function(String qrCode)? handleScannedQrCode,
    required TResult orElse(),
  }) {
    if (handleScannedQrCode != null) {
      return handleScannedQrCode(qrCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_generateQrCode value) generateQrCode,
    required TResult Function(_scanQrCode value) scanQrCode,
    required TResult Function(_handleScannedQrCode value) handleScannedQrCode,
  }) {
    return handleScannedQrCode(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_generateQrCode value)? generateQrCode,
    TResult Function(_scanQrCode value)? scanQrCode,
    TResult Function(_handleScannedQrCode value)? handleScannedQrCode,
    required TResult orElse(),
  }) {
    if (handleScannedQrCode != null) {
      return handleScannedQrCode(this);
    }
    return orElse();
  }
}

abstract class _handleScannedQrCode implements HomeEvent {
  const factory _handleScannedQrCode(String qrCode) = _$_handleScannedQrCode;

  String get qrCode => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$handleScannedQrCodeCopyWith<_handleScannedQrCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading onLoading() {
    return const _Loading();
  }

  _OnQrSeedReady onQrSeedReady(QrSeed qrSeed) {
    return _OnQrSeedReady(
      qrSeed,
    );
  }

  _OnQrScanRequested onQrScanRequested() {
    return const _OnQrScanRequested();
  }

  _OnQrCodeScanned onQrCodeScanned(String qrCode) {
    return _OnQrCodeScanned(
      qrCode,
    );
  }

  _OnErrorGenerationQrCode onErrorGeneratingQrCode() {
    return const _OnErrorGenerationQrCode();
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(QrSeed qrSeed) onQrSeedReady,
    required TResult Function() onQrScanRequested,
    required TResult Function(String qrCode) onQrCodeScanned,
    required TResult Function() onErrorGeneratingQrCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(QrSeed qrSeed)? onQrSeedReady,
    TResult Function()? onQrScanRequested,
    TResult Function(String qrCode)? onQrCodeScanned,
    TResult Function()? onErrorGeneratingQrCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) onLoading,
    required TResult Function(_OnQrSeedReady value) onQrSeedReady,
    required TResult Function(_OnQrScanRequested value) onQrScanRequested,
    required TResult Function(_OnQrCodeScanned value) onQrCodeScanned,
    required TResult Function(_OnErrorGenerationQrCode value)
        onErrorGeneratingQrCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? onLoading,
    TResult Function(_OnQrSeedReady value)? onQrSeedReady,
    TResult Function(_OnQrScanRequested value)? onQrScanRequested,
    TResult Function(_OnQrCodeScanned value)? onQrCodeScanned,
    TResult Function(_OnErrorGenerationQrCode value)? onErrorGeneratingQrCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
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
    return 'HomeState.initial()';
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
    required TResult Function() onLoading,
    required TResult Function(QrSeed qrSeed) onQrSeedReady,
    required TResult Function() onQrScanRequested,
    required TResult Function(String qrCode) onQrCodeScanned,
    required TResult Function() onErrorGeneratingQrCode,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(QrSeed qrSeed)? onQrSeedReady,
    TResult Function()? onQrScanRequested,
    TResult Function(String qrCode)? onQrCodeScanned,
    TResult Function()? onErrorGeneratingQrCode,
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
    required TResult Function(_Loading value) onLoading,
    required TResult Function(_OnQrSeedReady value) onQrSeedReady,
    required TResult Function(_OnQrScanRequested value) onQrScanRequested,
    required TResult Function(_OnQrCodeScanned value) onQrCodeScanned,
    required TResult Function(_OnErrorGenerationQrCode value)
        onErrorGeneratingQrCode,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? onLoading,
    TResult Function(_OnQrSeedReady value)? onQrSeedReady,
    TResult Function(_OnQrScanRequested value)? onQrScanRequested,
    TResult Function(_OnQrCodeScanned value)? onQrCodeScanned,
    TResult Function(_OnErrorGenerationQrCode value)? onErrorGeneratingQrCode,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
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
    return 'HomeState.onLoading()';
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
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(QrSeed qrSeed) onQrSeedReady,
    required TResult Function() onQrScanRequested,
    required TResult Function(String qrCode) onQrCodeScanned,
    required TResult Function() onErrorGeneratingQrCode,
  }) {
    return onLoading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(QrSeed qrSeed)? onQrSeedReady,
    TResult Function()? onQrScanRequested,
    TResult Function(String qrCode)? onQrCodeScanned,
    TResult Function()? onErrorGeneratingQrCode,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) onLoading,
    required TResult Function(_OnQrSeedReady value) onQrSeedReady,
    required TResult Function(_OnQrScanRequested value) onQrScanRequested,
    required TResult Function(_OnQrCodeScanned value) onQrCodeScanned,
    required TResult Function(_OnErrorGenerationQrCode value)
        onErrorGeneratingQrCode,
  }) {
    return onLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? onLoading,
    TResult Function(_OnQrSeedReady value)? onQrSeedReady,
    TResult Function(_OnQrScanRequested value)? onQrScanRequested,
    TResult Function(_OnQrCodeScanned value)? onQrCodeScanned,
    TResult Function(_OnErrorGenerationQrCode value)? onErrorGeneratingQrCode,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomeState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$OnQrSeedReadyCopyWith<$Res> {
  factory _$OnQrSeedReadyCopyWith(
          _OnQrSeedReady value, $Res Function(_OnQrSeedReady) then) =
      __$OnQrSeedReadyCopyWithImpl<$Res>;
  $Res call({QrSeed qrSeed});

  $QrSeedCopyWith<$Res> get qrSeed;
}

/// @nodoc
class __$OnQrSeedReadyCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$OnQrSeedReadyCopyWith<$Res> {
  __$OnQrSeedReadyCopyWithImpl(
      _OnQrSeedReady _value, $Res Function(_OnQrSeedReady) _then)
      : super(_value, (v) => _then(v as _OnQrSeedReady));

  @override
  _OnQrSeedReady get _value => super._value as _OnQrSeedReady;

  @override
  $Res call({
    Object? qrSeed = freezed,
  }) {
    return _then(_OnQrSeedReady(
      qrSeed == freezed
          ? _value.qrSeed
          : qrSeed // ignore: cast_nullable_to_non_nullable
              as QrSeed,
    ));
  }

  @override
  $QrSeedCopyWith<$Res> get qrSeed {
    return $QrSeedCopyWith<$Res>(_value.qrSeed, (value) {
      return _then(_value.copyWith(qrSeed: value));
    });
  }
}

/// @nodoc

class _$_OnQrSeedReady implements _OnQrSeedReady {
  const _$_OnQrSeedReady(this.qrSeed);

  @override
  final QrSeed qrSeed;

  @override
  String toString() {
    return 'HomeState.onQrSeedReady(qrSeed: $qrSeed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnQrSeedReady &&
            (identical(other.qrSeed, qrSeed) ||
                const DeepCollectionEquality().equals(other.qrSeed, qrSeed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(qrSeed);

  @JsonKey(ignore: true)
  @override
  _$OnQrSeedReadyCopyWith<_OnQrSeedReady> get copyWith =>
      __$OnQrSeedReadyCopyWithImpl<_OnQrSeedReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(QrSeed qrSeed) onQrSeedReady,
    required TResult Function() onQrScanRequested,
    required TResult Function(String qrCode) onQrCodeScanned,
    required TResult Function() onErrorGeneratingQrCode,
  }) {
    return onQrSeedReady(qrSeed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(QrSeed qrSeed)? onQrSeedReady,
    TResult Function()? onQrScanRequested,
    TResult Function(String qrCode)? onQrCodeScanned,
    TResult Function()? onErrorGeneratingQrCode,
    required TResult orElse(),
  }) {
    if (onQrSeedReady != null) {
      return onQrSeedReady(qrSeed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) onLoading,
    required TResult Function(_OnQrSeedReady value) onQrSeedReady,
    required TResult Function(_OnQrScanRequested value) onQrScanRequested,
    required TResult Function(_OnQrCodeScanned value) onQrCodeScanned,
    required TResult Function(_OnErrorGenerationQrCode value)
        onErrorGeneratingQrCode,
  }) {
    return onQrSeedReady(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? onLoading,
    TResult Function(_OnQrSeedReady value)? onQrSeedReady,
    TResult Function(_OnQrScanRequested value)? onQrScanRequested,
    TResult Function(_OnQrCodeScanned value)? onQrCodeScanned,
    TResult Function(_OnErrorGenerationQrCode value)? onErrorGeneratingQrCode,
    required TResult orElse(),
  }) {
    if (onQrSeedReady != null) {
      return onQrSeedReady(this);
    }
    return orElse();
  }
}

abstract class _OnQrSeedReady implements HomeState {
  const factory _OnQrSeedReady(QrSeed qrSeed) = _$_OnQrSeedReady;

  QrSeed get qrSeed => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$OnQrSeedReadyCopyWith<_OnQrSeedReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnQrScanRequestedCopyWith<$Res> {
  factory _$OnQrScanRequestedCopyWith(
          _OnQrScanRequested value, $Res Function(_OnQrScanRequested) then) =
      __$OnQrScanRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$OnQrScanRequestedCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res>
    implements _$OnQrScanRequestedCopyWith<$Res> {
  __$OnQrScanRequestedCopyWithImpl(
      _OnQrScanRequested _value, $Res Function(_OnQrScanRequested) _then)
      : super(_value, (v) => _then(v as _OnQrScanRequested));

  @override
  _OnQrScanRequested get _value => super._value as _OnQrScanRequested;
}

/// @nodoc

class _$_OnQrScanRequested implements _OnQrScanRequested {
  const _$_OnQrScanRequested();

  @override
  String toString() {
    return 'HomeState.onQrScanRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnQrScanRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(QrSeed qrSeed) onQrSeedReady,
    required TResult Function() onQrScanRequested,
    required TResult Function(String qrCode) onQrCodeScanned,
    required TResult Function() onErrorGeneratingQrCode,
  }) {
    return onQrScanRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(QrSeed qrSeed)? onQrSeedReady,
    TResult Function()? onQrScanRequested,
    TResult Function(String qrCode)? onQrCodeScanned,
    TResult Function()? onErrorGeneratingQrCode,
    required TResult orElse(),
  }) {
    if (onQrScanRequested != null) {
      return onQrScanRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) onLoading,
    required TResult Function(_OnQrSeedReady value) onQrSeedReady,
    required TResult Function(_OnQrScanRequested value) onQrScanRequested,
    required TResult Function(_OnQrCodeScanned value) onQrCodeScanned,
    required TResult Function(_OnErrorGenerationQrCode value)
        onErrorGeneratingQrCode,
  }) {
    return onQrScanRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? onLoading,
    TResult Function(_OnQrSeedReady value)? onQrSeedReady,
    TResult Function(_OnQrScanRequested value)? onQrScanRequested,
    TResult Function(_OnQrCodeScanned value)? onQrCodeScanned,
    TResult Function(_OnErrorGenerationQrCode value)? onErrorGeneratingQrCode,
    required TResult orElse(),
  }) {
    if (onQrScanRequested != null) {
      return onQrScanRequested(this);
    }
    return orElse();
  }
}

abstract class _OnQrScanRequested implements HomeState {
  const factory _OnQrScanRequested() = _$_OnQrScanRequested;
}

/// @nodoc
abstract class _$OnQrCodeScannedCopyWith<$Res> {
  factory _$OnQrCodeScannedCopyWith(
          _OnQrCodeScanned value, $Res Function(_OnQrCodeScanned) then) =
      __$OnQrCodeScannedCopyWithImpl<$Res>;
  $Res call({String qrCode});
}

/// @nodoc
class __$OnQrCodeScannedCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$OnQrCodeScannedCopyWith<$Res> {
  __$OnQrCodeScannedCopyWithImpl(
      _OnQrCodeScanned _value, $Res Function(_OnQrCodeScanned) _then)
      : super(_value, (v) => _then(v as _OnQrCodeScanned));

  @override
  _OnQrCodeScanned get _value => super._value as _OnQrCodeScanned;

  @override
  $Res call({
    Object? qrCode = freezed,
  }) {
    return _then(_OnQrCodeScanned(
      qrCode == freezed
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnQrCodeScanned implements _OnQrCodeScanned {
  const _$_OnQrCodeScanned(this.qrCode);

  @override
  final String qrCode;

  @override
  String toString() {
    return 'HomeState.onQrCodeScanned(qrCode: $qrCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnQrCodeScanned &&
            (identical(other.qrCode, qrCode) ||
                const DeepCollectionEquality().equals(other.qrCode, qrCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(qrCode);

  @JsonKey(ignore: true)
  @override
  _$OnQrCodeScannedCopyWith<_OnQrCodeScanned> get copyWith =>
      __$OnQrCodeScannedCopyWithImpl<_OnQrCodeScanned>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(QrSeed qrSeed) onQrSeedReady,
    required TResult Function() onQrScanRequested,
    required TResult Function(String qrCode) onQrCodeScanned,
    required TResult Function() onErrorGeneratingQrCode,
  }) {
    return onQrCodeScanned(qrCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(QrSeed qrSeed)? onQrSeedReady,
    TResult Function()? onQrScanRequested,
    TResult Function(String qrCode)? onQrCodeScanned,
    TResult Function()? onErrorGeneratingQrCode,
    required TResult orElse(),
  }) {
    if (onQrCodeScanned != null) {
      return onQrCodeScanned(qrCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) onLoading,
    required TResult Function(_OnQrSeedReady value) onQrSeedReady,
    required TResult Function(_OnQrScanRequested value) onQrScanRequested,
    required TResult Function(_OnQrCodeScanned value) onQrCodeScanned,
    required TResult Function(_OnErrorGenerationQrCode value)
        onErrorGeneratingQrCode,
  }) {
    return onQrCodeScanned(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? onLoading,
    TResult Function(_OnQrSeedReady value)? onQrSeedReady,
    TResult Function(_OnQrScanRequested value)? onQrScanRequested,
    TResult Function(_OnQrCodeScanned value)? onQrCodeScanned,
    TResult Function(_OnErrorGenerationQrCode value)? onErrorGeneratingQrCode,
    required TResult orElse(),
  }) {
    if (onQrCodeScanned != null) {
      return onQrCodeScanned(this);
    }
    return orElse();
  }
}

abstract class _OnQrCodeScanned implements HomeState {
  const factory _OnQrCodeScanned(String qrCode) = _$_OnQrCodeScanned;

  String get qrCode => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$OnQrCodeScannedCopyWith<_OnQrCodeScanned> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnErrorGenerationQrCodeCopyWith<$Res> {
  factory _$OnErrorGenerationQrCodeCopyWith(_OnErrorGenerationQrCode value,
          $Res Function(_OnErrorGenerationQrCode) then) =
      __$OnErrorGenerationQrCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$OnErrorGenerationQrCodeCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res>
    implements _$OnErrorGenerationQrCodeCopyWith<$Res> {
  __$OnErrorGenerationQrCodeCopyWithImpl(_OnErrorGenerationQrCode _value,
      $Res Function(_OnErrorGenerationQrCode) _then)
      : super(_value, (v) => _then(v as _OnErrorGenerationQrCode));

  @override
  _OnErrorGenerationQrCode get _value =>
      super._value as _OnErrorGenerationQrCode;
}

/// @nodoc

class _$_OnErrorGenerationQrCode implements _OnErrorGenerationQrCode {
  const _$_OnErrorGenerationQrCode();

  @override
  String toString() {
    return 'HomeState.onErrorGeneratingQrCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnErrorGenerationQrCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(QrSeed qrSeed) onQrSeedReady,
    required TResult Function() onQrScanRequested,
    required TResult Function(String qrCode) onQrCodeScanned,
    required TResult Function() onErrorGeneratingQrCode,
  }) {
    return onErrorGeneratingQrCode();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(QrSeed qrSeed)? onQrSeedReady,
    TResult Function()? onQrScanRequested,
    TResult Function(String qrCode)? onQrCodeScanned,
    TResult Function()? onErrorGeneratingQrCode,
    required TResult orElse(),
  }) {
    if (onErrorGeneratingQrCode != null) {
      return onErrorGeneratingQrCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) onLoading,
    required TResult Function(_OnQrSeedReady value) onQrSeedReady,
    required TResult Function(_OnQrScanRequested value) onQrScanRequested,
    required TResult Function(_OnQrCodeScanned value) onQrCodeScanned,
    required TResult Function(_OnErrorGenerationQrCode value)
        onErrorGeneratingQrCode,
  }) {
    return onErrorGeneratingQrCode(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? onLoading,
    TResult Function(_OnQrSeedReady value)? onQrSeedReady,
    TResult Function(_OnQrScanRequested value)? onQrScanRequested,
    TResult Function(_OnQrCodeScanned value)? onQrCodeScanned,
    TResult Function(_OnErrorGenerationQrCode value)? onErrorGeneratingQrCode,
    required TResult orElse(),
  }) {
    if (onErrorGeneratingQrCode != null) {
      return onErrorGeneratingQrCode(this);
    }
    return orElse();
  }
}

abstract class _OnErrorGenerationQrCode implements HomeState {
  const factory _OnErrorGenerationQrCode() = _$_OnErrorGenerationQrCode;
}
