// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'qr_scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$QrScanStateTearOff {
  const _$QrScanStateTearOff();

// ignore: unused_element
  Scanned scanned({@required List<String> decodedStrings}) {
    return Scanned(
      decodedStrings: decodedStrings,
    );
  }

// ignore: unused_element
  Initial initial() {
    return const Initial();
  }

// ignore: unused_element
  Scanning scanning() {
    return const Scanning();
  }

// ignore: unused_element
  Error error([String message]) {
    return Error(
      message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $QrScanState = _$QrScanStateTearOff();

/// @nodoc
mixin _$QrScanState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult scanned(List<String> decodedStrings),
    @required TResult initial(),
    @required TResult scanning(),
    @required TResult error(String message),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult scanned(List<String> decodedStrings),
    TResult initial(),
    TResult scanning(),
    TResult error(String message),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult scanned(Scanned value),
    @required TResult initial(Initial value),
    @required TResult scanning(Scanning value),
    @required TResult error(Error value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult scanned(Scanned value),
    TResult initial(Initial value),
    TResult scanning(Scanning value),
    TResult error(Error value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $QrScanStateCopyWith<$Res> {
  factory $QrScanStateCopyWith(
          QrScanState value, $Res Function(QrScanState) then) =
      _$QrScanStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$QrScanStateCopyWithImpl<$Res> implements $QrScanStateCopyWith<$Res> {
  _$QrScanStateCopyWithImpl(this._value, this._then);

  final QrScanState _value;
  // ignore: unused_field
  final $Res Function(QrScanState) _then;
}

/// @nodoc
abstract class $ScannedCopyWith<$Res> {
  factory $ScannedCopyWith(Scanned value, $Res Function(Scanned) then) =
      _$ScannedCopyWithImpl<$Res>;
  $Res call({List<String> decodedStrings});
}

/// @nodoc
class _$ScannedCopyWithImpl<$Res> extends _$QrScanStateCopyWithImpl<$Res>
    implements $ScannedCopyWith<$Res> {
  _$ScannedCopyWithImpl(Scanned _value, $Res Function(Scanned) _then)
      : super(_value, (v) => _then(v as Scanned));

  @override
  Scanned get _value => super._value as Scanned;

  @override
  $Res call({
    Object decodedStrings = freezed,
  }) {
    return _then(Scanned(
      decodedStrings: decodedStrings == freezed
          ? _value.decodedStrings
          : decodedStrings as List<String>,
    ));
  }
}

/// @nodoc
class _$Scanned implements Scanned {
  const _$Scanned({@required this.decodedStrings})
      : assert(decodedStrings != null);

  @override
  final List<String> decodedStrings;

  @override
  String toString() {
    return 'QrScanState.scanned(decodedStrings: $decodedStrings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Scanned &&
            (identical(other.decodedStrings, decodedStrings) ||
                const DeepCollectionEquality()
                    .equals(other.decodedStrings, decodedStrings)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(decodedStrings);

  @JsonKey(ignore: true)
  @override
  $ScannedCopyWith<Scanned> get copyWith =>
      _$ScannedCopyWithImpl<Scanned>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult scanned(List<String> decodedStrings),
    @required TResult initial(),
    @required TResult scanning(),
    @required TResult error(String message),
  }) {
    assert(scanned != null);
    assert(initial != null);
    assert(scanning != null);
    assert(error != null);
    return scanned(decodedStrings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult scanned(List<String> decodedStrings),
    TResult initial(),
    TResult scanning(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (scanned != null) {
      return scanned(decodedStrings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult scanned(Scanned value),
    @required TResult initial(Initial value),
    @required TResult scanning(Scanning value),
    @required TResult error(Error value),
  }) {
    assert(scanned != null);
    assert(initial != null);
    assert(scanning != null);
    assert(error != null);
    return scanned(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult scanned(Scanned value),
    TResult initial(Initial value),
    TResult scanning(Scanning value),
    TResult error(Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (scanned != null) {
      return scanned(this);
    }
    return orElse();
  }
}

abstract class Scanned implements QrScanState {
  const factory Scanned({@required List<String> decodedStrings}) = _$Scanned;

  List<String> get decodedStrings;
  @JsonKey(ignore: true)
  $ScannedCopyWith<Scanned> get copyWith;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$QrScanStateCopyWithImpl<$Res>
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
    return 'QrScanState.initial()';
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
    @required TResult scanned(List<String> decodedStrings),
    @required TResult initial(),
    @required TResult scanning(),
    @required TResult error(String message),
  }) {
    assert(scanned != null);
    assert(initial != null);
    assert(scanning != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult scanned(List<String> decodedStrings),
    TResult initial(),
    TResult scanning(),
    TResult error(String message),
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
    @required TResult scanned(Scanned value),
    @required TResult initial(Initial value),
    @required TResult scanning(Scanning value),
    @required TResult error(Error value),
  }) {
    assert(scanned != null);
    assert(initial != null);
    assert(scanning != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult scanned(Scanned value),
    TResult initial(Initial value),
    TResult scanning(Scanning value),
    TResult error(Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements QrScanState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $ScanningCopyWith<$Res> {
  factory $ScanningCopyWith(Scanning value, $Res Function(Scanning) then) =
      _$ScanningCopyWithImpl<$Res>;
}

/// @nodoc
class _$ScanningCopyWithImpl<$Res> extends _$QrScanStateCopyWithImpl<$Res>
    implements $ScanningCopyWith<$Res> {
  _$ScanningCopyWithImpl(Scanning _value, $Res Function(Scanning) _then)
      : super(_value, (v) => _then(v as Scanning));

  @override
  Scanning get _value => super._value as Scanning;
}

/// @nodoc
class _$Scanning implements Scanning {
  const _$Scanning();

  @override
  String toString() {
    return 'QrScanState.scanning()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Scanning);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult scanned(List<String> decodedStrings),
    @required TResult initial(),
    @required TResult scanning(),
    @required TResult error(String message),
  }) {
    assert(scanned != null);
    assert(initial != null);
    assert(scanning != null);
    assert(error != null);
    return scanning();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult scanned(List<String> decodedStrings),
    TResult initial(),
    TResult scanning(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (scanning != null) {
      return scanning();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult scanned(Scanned value),
    @required TResult initial(Initial value),
    @required TResult scanning(Scanning value),
    @required TResult error(Error value),
  }) {
    assert(scanned != null);
    assert(initial != null);
    assert(scanning != null);
    assert(error != null);
    return scanning(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult scanned(Scanned value),
    TResult initial(Initial value),
    TResult scanning(Scanning value),
    TResult error(Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (scanning != null) {
      return scanning(this);
    }
    return orElse();
  }
}

abstract class Scanning implements QrScanState {
  const factory Scanning() = _$Scanning;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$QrScanStateCopyWithImpl<$Res>
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
    return 'QrScanState.error(message: $message)';
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
    @required TResult scanned(List<String> decodedStrings),
    @required TResult initial(),
    @required TResult scanning(),
    @required TResult error(String message),
  }) {
    assert(scanned != null);
    assert(initial != null);
    assert(scanning != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult scanned(List<String> decodedStrings),
    TResult initial(),
    TResult scanning(),
    TResult error(String message),
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
    @required TResult scanned(Scanned value),
    @required TResult initial(Initial value),
    @required TResult scanning(Scanning value),
    @required TResult error(Error value),
  }) {
    assert(scanned != null);
    assert(initial != null);
    assert(scanning != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult scanned(Scanned value),
    TResult initial(Initial value),
    TResult scanning(Scanning value),
    TResult error(Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements QrScanState {
  const factory Error([String message]) = _$Error;

  String get message;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith;
}
