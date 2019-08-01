import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'seed.g.dart';

abstract class Seed implements Built<Seed, SeedBuilder> {
  @BuiltValueField(wireName: "seed")
  String get value;

  @BuiltValueField(wireName: "expires_at")
  String get expiresAtStr;

  DateTime get expiresAt {
    return DateTime.parse(expiresAtStr);
  }

  bool get isExpired {
    return DateTime.now().isAfter(expiresAt);
  }

  bool get isNotExpired {
    return !isExpired;
  }

  Seed._();

  factory Seed([updates(SeedBuilder b)]) = _$Seed;

  static Serializer<Seed> get serializer => _$seedSerializer;
}
