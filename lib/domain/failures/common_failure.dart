import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_failure.freezed.dart';

@freezed
class CommonFailure with _$CommonFailure {
  const CommonFailure._();
  const factory CommonFailure.noInternet() = _NoInternet;
  const factory CommonFailure.unknown([String? message]) = _Unknown;
}
