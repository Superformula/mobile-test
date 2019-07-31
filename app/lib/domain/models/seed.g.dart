// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Seed> _$seedSerializer = new _$SeedSerializer();

class _$SeedSerializer implements StructuredSerializer<Seed> {
  @override
  final Iterable<Type> types = const [Seed, _$Seed];
  @override
  final String wireName = 'Seed';

  @override
  Iterable<Object> serialize(Serializers serializers, Seed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'seed',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
      'expires_at',
      serializers.serialize(object.expiresAtStr,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Seed deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SeedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'seed':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'expires_at':
          result.expiresAtStr = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Seed extends Seed {
  @override
  final String value;
  @override
  final String expiresAtStr;

  factory _$Seed([void Function(SeedBuilder) updates]) =>
      (new SeedBuilder()..update(updates)).build();

  _$Seed._({this.value, this.expiresAtStr}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('Seed', 'value');
    }
    if (expiresAtStr == null) {
      throw new BuiltValueNullFieldError('Seed', 'expiresAtStr');
    }
  }

  @override
  Seed rebuild(void Function(SeedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeedBuilder toBuilder() => new SeedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Seed &&
        value == other.value &&
        expiresAtStr == other.expiresAtStr;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, value.hashCode), expiresAtStr.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Seed')
          ..add('value', value)
          ..add('expiresAtStr', expiresAtStr))
        .toString();
  }
}

class SeedBuilder implements Builder<Seed, SeedBuilder> {
  _$Seed _$v;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  String _expiresAtStr;
  String get expiresAtStr => _$this._expiresAtStr;
  set expiresAtStr(String expiresAtStr) => _$this._expiresAtStr = expiresAtStr;

  SeedBuilder();

  SeedBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _expiresAtStr = _$v.expiresAtStr;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Seed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Seed;
  }

  @override
  void update(void Function(SeedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Seed build() {
    final _$result =
        _$v ?? new _$Seed._(value: value, expiresAtStr: expiresAtStr);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
