import 'package:freezed_annotation/freezed_annotation.dart';

part 'seed.freezed.dart';

@freezed
abstract class Seed with _$Seed {
  const factory Seed({
    @required String value,
    @required DateTime expiresAt,
  }) = _Seed;
}
