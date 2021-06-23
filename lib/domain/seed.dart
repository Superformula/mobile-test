import 'package:freezed_annotation/freezed_annotation.dart';

part 'seed.freezed.dart';

@freezed
class Seed with _$Seed {
  const Seed._();
  const factory Seed({
    required String seed,
    required DateTime expiresAt,
  }) = _Seed;
}
