// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, public_member_api_docs

part of 'qr_generator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$QrGeneratorStateTearOff {
  const _$QrGeneratorStateTearOff();

// ignore: unused_element
  Data data({@required Seed seed}) {
    return Data(
      seed: seed,
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
  Expired expired() {
    return const Expired();
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
const $QrGeneratorState = _$QrGeneratorStateTearOff();

/// @nodoc
mixin _$QrGeneratorState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(Seed seed),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult expired(),
    @required TResult error(String message),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Seed seed),
    TResult initial(),
    TResult loading(),
    TResult expired(),
    TResult error(String message),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(Data value),
    @required TResult initial(Initial value),
    @required TResult loading(Loading value),
    @required TResult expired(Expired value),
    @required TResult error(Error value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(Data value),
    TResult initial(Initial value),
    TResult loading(Loading value),
    TResult expired(Expired value),
    TResult error(Error value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $QrGeneratorStateCopyWith<$Res> {
  factory $QrGeneratorStateCopyWith(
          QrGeneratorState value, $Res Function(QrGeneratorState) then) =
      _$QrGeneratorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$QrGeneratorStateCopyWithImpl<$Res>
    implements $QrGeneratorStateCopyWith<$Res> {
  _$QrGeneratorStateCopyWithImpl(this._value, this._then);

  final QrGeneratorState _value;
  // ignore: unused_field
  final $Res Function(QrGeneratorState) _then;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call({Seed seed});
}

/// @nodoc
class _$DataCopyWithImpl<$Res> extends _$QrGeneratorStateCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(Data _value, $Res Function(Data) _then)
      : super(_value, (v) => _then(v as Data));

  @override
  Data get _value => super._value as Data;

  @override
  $Res call({
    Object seed = freezed,
  }) {
    return _then(Data(
      seed: seed == freezed ? _value.seed : seed as Seed,
    ));
  }
}

/// @nodoc
class _$Data implements Data {
  const _$Data({@required this.seed}) : assert(seed != null);

  @override
  final Seed seed;

  @override
  String toString() {
    return 'QrGeneratorState.data(seed: $seed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Data &&
            (identical(other.seed, seed) ||
                const DeepCollectionEquality().equals(other.seed, seed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(seed);

  @JsonKey(ignore: true)
  @override
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(Seed seed),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult expired(),
    @required TResult error(String message),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return data(seed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Seed seed),
    TResult initial(),
    TResult loading(),
    TResult expired(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(seed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(Data value),
    @required TResult initial(Initial value),
    @required TResult loading(Loading value),
    @required TResult expired(Expired value),
    @required TResult error(Error value),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(Data value),
    TResult initial(Initial value),
    TResult loading(Loading value),
    TResult expired(Expired value),
    TResult error(Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data implements QrGeneratorState {
  const factory Data({@required Seed seed}) = _$Data;

  Seed get seed;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$QrGeneratorStateCopyWithImpl<$Res>
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
    return 'QrGeneratorState.initial()';
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
    @required TResult data(Seed seed),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult expired(),
    @required TResult error(String message),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Seed seed),
    TResult initial(),
    TResult loading(),
    TResult expired(),
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
    @required TResult data(Data value),
    @required TResult initial(Initial value),
    @required TResult loading(Loading value),
    @required TResult expired(Expired value),
    @required TResult error(Error value),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(Data value),
    TResult initial(Initial value),
    TResult loading(Loading value),
    TResult expired(Expired value),
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

abstract class Initial implements QrGeneratorState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$QrGeneratorStateCopyWithImpl<$Res>
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
    return 'QrGeneratorState.loading()';
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
    @required TResult data(Seed seed),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult expired(),
    @required TResult error(String message),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Seed seed),
    TResult initial(),
    TResult loading(),
    TResult expired(),
    TResult error(String message),
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
    @required TResult data(Data value),
    @required TResult initial(Initial value),
    @required TResult loading(Loading value),
    @required TResult expired(Expired value),
    @required TResult error(Error value),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(Data value),
    TResult initial(Initial value),
    TResult loading(Loading value),
    TResult expired(Expired value),
    TResult error(Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements QrGeneratorState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $ExpiredCopyWith<$Res> {
  factory $ExpiredCopyWith(Expired value, $Res Function(Expired) then) =
      _$ExpiredCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExpiredCopyWithImpl<$Res> extends _$QrGeneratorStateCopyWithImpl<$Res>
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
    return 'QrGeneratorState.expired()';
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
    @required TResult data(Seed seed),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult expired(),
    @required TResult error(String message),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return expired();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Seed seed),
    TResult initial(),
    TResult loading(),
    TResult expired(),
    TResult error(String message),
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
    @required TResult data(Data value),
    @required TResult initial(Initial value),
    @required TResult loading(Loading value),
    @required TResult expired(Expired value),
    @required TResult error(Error value),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return expired(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(Data value),
    TResult initial(Initial value),
    TResult loading(Loading value),
    TResult expired(Expired value),
    TResult error(Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (expired != null) {
      return expired(this);
    }
    return orElse();
  }
}

abstract class Expired implements QrGeneratorState {
  const factory Expired() = _$Expired;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$QrGeneratorStateCopyWithImpl<$Res>
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
    return 'QrGeneratorState.error(message: $message)';
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
    @required TResult data(Seed seed),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult expired(),
    @required TResult error(String message),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Seed seed),
    TResult initial(),
    TResult loading(),
    TResult expired(),
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
    @required TResult data(Data value),
    @required TResult initial(Initial value),
    @required TResult loading(Loading value),
    @required TResult expired(Expired value),
    @required TResult error(Error value),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(Data value),
    TResult initial(Initial value),
    TResult loading(Loading value),
    TResult expired(Expired value),
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

abstract class Error implements QrGeneratorState {
  const factory Error([String message]) = _$Error;

  String get message;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith;
}
