// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'qr_gen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$QrGenStateTearOff {
  const _$QrGenStateTearOff();

// ignore: unused_element
  QRCode code({@required QrPainter qrPainter, @required DateTime expiration}) {
    return QRCode(
      qrPainter: qrPainter,
      expiration: expiration,
    );
  }

// ignore: unused_element
  Initial initial() {
    return const Initial();
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Error error([String message]) {
    return Error(
      message,
    );
  }

// ignore: unused_element
  Expired expired() {
    return const Expired();
  }
}

/// @nodoc
// ignore: unused_element
const $QrGenState = _$QrGenStateTearOff();

/// @nodoc
mixin _$QrGenState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult code(QrPainter qrPainter, DateTime expiration),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult error(String message),
    @required TResult expired(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult code(QrPainter qrPainter, DateTime expiration),
    TResult initial(),
    TResult loading(),
    TResult error(String message),
    TResult expired(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult code(QRCode value),
    @required TResult initial(Initial value),
    @required TResult loading(Loading value),
    @required TResult error(Error value),
    @required TResult expired(Expired value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult code(QRCode value),
    TResult initial(Initial value),
    TResult loading(Loading value),
    TResult error(Error value),
    TResult expired(Expired value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $QrGenStateCopyWith<$Res> {
  factory $QrGenStateCopyWith(
          QrGenState value, $Res Function(QrGenState) then) =
      _$QrGenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$QrGenStateCopyWithImpl<$Res> implements $QrGenStateCopyWith<$Res> {
  _$QrGenStateCopyWithImpl(this._value, this._then);

  final QrGenState _value;
  // ignore: unused_field
  final $Res Function(QrGenState) _then;
}

/// @nodoc
abstract class $QRCodeCopyWith<$Res> {
  factory $QRCodeCopyWith(QRCode value, $Res Function(QRCode) then) =
      _$QRCodeCopyWithImpl<$Res>;
  $Res call({QrPainter qrPainter, DateTime expiration});
}

/// @nodoc
class _$QRCodeCopyWithImpl<$Res> extends _$QrGenStateCopyWithImpl<$Res>
    implements $QRCodeCopyWith<$Res> {
  _$QRCodeCopyWithImpl(QRCode _value, $Res Function(QRCode) _then)
      : super(_value, (v) => _then(v as QRCode));

  @override
  QRCode get _value => super._value as QRCode;

  @override
  $Res call({
    Object qrPainter = freezed,
    Object expiration = freezed,
  }) {
    return _then(QRCode(
      qrPainter:
          qrPainter == freezed ? _value.qrPainter : qrPainter as QrPainter,
      expiration:
          expiration == freezed ? _value.expiration : expiration as DateTime,
    ));
  }
}

/// @nodoc
class _$QRCode implements QRCode {
  const _$QRCode({@required this.qrPainter, @required this.expiration})
      : assert(qrPainter != null),
        assert(expiration != null);

  @override
  final QrPainter qrPainter;
  @override
  final DateTime expiration;

  @override
  String toString() {
    return 'QrGenState.code(qrPainter: $qrPainter, expiration: $expiration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QRCode &&
            (identical(other.qrPainter, qrPainter) ||
                const DeepCollectionEquality()
                    .equals(other.qrPainter, qrPainter)) &&
            (identical(other.expiration, expiration) ||
                const DeepCollectionEquality()
                    .equals(other.expiration, expiration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(qrPainter) ^
      const DeepCollectionEquality().hash(expiration);

  @JsonKey(ignore: true)
  @override
  $QRCodeCopyWith<QRCode> get copyWith =>
      _$QRCodeCopyWithImpl<QRCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult code(QrPainter qrPainter, DateTime expiration),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult error(String message),
    @required TResult expired(),
  }) {
    assert(code != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(expired != null);
    return code(qrPainter, expiration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult code(QrPainter qrPainter, DateTime expiration),
    TResult initial(),
    TResult loading(),
    TResult error(String message),
    TResult expired(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (code != null) {
      return code(qrPainter, expiration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult code(QRCode value),
    @required TResult initial(Initial value),
    @required TResult loading(Loading value),
    @required TResult error(Error value),
    @required TResult expired(Expired value),
  }) {
    assert(code != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(expired != null);
    return code(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult code(QRCode value),
    TResult initial(Initial value),
    TResult loading(Loading value),
    TResult error(Error value),
    TResult expired(Expired value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (code != null) {
      return code(this);
    }
    return orElse();
  }
}

abstract class QRCode implements QrGenState {
  const factory QRCode(
      {@required QrPainter qrPainter,
      @required DateTime expiration}) = _$QRCode;

  QrPainter get qrPainter;
  DateTime get expiration;
  @JsonKey(ignore: true)
  $QRCodeCopyWith<QRCode> get copyWith;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$QrGenStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc
class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'QrGenState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult code(QrPainter qrPainter, DateTime expiration),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult error(String message),
    @required TResult expired(),
  }) {
    assert(code != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(expired != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult code(QrPainter qrPainter, DateTime expiration),
    TResult initial(),
    TResult loading(),
    TResult error(String message),
    TResult expired(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult code(QRCode value),
    @required TResult initial(Initial value),
    @required TResult loading(Loading value),
    @required TResult error(Error value),
    @required TResult expired(Expired value),
  }) {
    assert(code != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(expired != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult code(QRCode value),
    TResult initial(Initial value),
    TResult loading(Loading value),
    TResult error(Error value),
    TResult expired(Expired value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements QrGenState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$QrGenStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc
class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'QrGenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult code(QrPainter qrPainter, DateTime expiration),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult error(String message),
    @required TResult expired(),
  }) {
    assert(code != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(expired != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult code(QrPainter qrPainter, DateTime expiration),
    TResult initial(),
    TResult loading(),
    TResult error(String message),
    TResult expired(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult code(QRCode value),
    @required TResult initial(Initial value),
    @required TResult loading(Loading value),
    @required TResult error(Error value),
    @required TResult expired(Expired value),
  }) {
    assert(code != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(expired != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult code(QRCode value),
    TResult initial(Initial value),
    TResult loading(Loading value),
    TResult error(Error value),
    TResult expired(Expired value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements QrGenState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$QrGenStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(Error(
      message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$Error implements Error {
  const _$Error([this.message]);

  @override
  final String message;

  @override
  String toString() {
    return 'QrGenState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult code(QrPainter qrPainter, DateTime expiration),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult error(String message),
    @required TResult expired(),
  }) {
    assert(code != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(expired != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult code(QrPainter qrPainter, DateTime expiration),
    TResult initial(),
    TResult loading(),
    TResult error(String message),
    TResult expired(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult code(QRCode value),
    @required TResult initial(Initial value),
    @required TResult loading(Loading value),
    @required TResult error(Error value),
    @required TResult expired(Expired value),
  }) {
    assert(code != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(expired != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult code(QRCode value),
    TResult initial(Initial value),
    TResult loading(Loading value),
    TResult error(Error value),
    TResult expired(Expired value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements QrGenState {
  const factory Error([String message]) = _$Error;

  String get message;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith;
}

/// @nodoc
abstract class $ExpiredCopyWith<$Res> {
  factory $ExpiredCopyWith(Expired value, $Res Function(Expired) then) =
      _$ExpiredCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExpiredCopyWithImpl<$Res> extends _$QrGenStateCopyWithImpl<$Res>
    implements $ExpiredCopyWith<$Res> {
  _$ExpiredCopyWithImpl(Expired _value, $Res Function(Expired) _then)
      : super(_value, (v) => _then(v as Expired));

  @override
  Expired get _value => super._value as Expired;
}

/// @nodoc
class _$Expired implements Expired {
  const _$Expired();

  @override
  String toString() {
    return 'QrGenState.expired()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Expired);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult code(QrPainter qrPainter, DateTime expiration),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult error(String message),
    @required TResult expired(),
  }) {
    assert(code != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(expired != null);
    return expired();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult code(QrPainter qrPainter, DateTime expiration),
    TResult initial(),
    TResult loading(),
    TResult error(String message),
    TResult expired(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (expired != null) {
      return expired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult code(QRCode value),
    @required TResult initial(Initial value),
    @required TResult loading(Loading value),
    @required TResult error(Error value),
    @required TResult expired(Expired value),
  }) {
    assert(code != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(expired != null);
    return expired(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult code(QRCode value),
    TResult initial(Initial value),
    TResult loading(Loading value),
    TResult error(Error value),
    TResult expired(Expired value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (expired != null) {
      return expired(this);
    }
    return orElse();
  }
}

abstract class Expired implements QrGenState {
  const factory Expired() = _$Expired;
}
