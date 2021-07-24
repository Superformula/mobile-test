import 'package:freezed_annotation/freezed_annotation.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///
part 'qr_seed.freezed.dart';

@freezed
class QrSeed with _$QrSeed {
  factory QrSeed({
    required String seed,
    required DateTime expiresAt,
  }) = _QrSeed;
}
