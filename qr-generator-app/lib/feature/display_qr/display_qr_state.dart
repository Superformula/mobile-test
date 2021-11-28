import 'package:freezed_annotation/freezed_annotation.dart';

part 'display_qr_state.freezed.dart';

@freezed
class DisplayQrState with _$DisplayQrState {
  const factory DisplayQrState.initial() = Initial;
  const factory DisplayQrState.loading() = Loading;
  const factory DisplayQrState.success(String seed) = Success;
  const factory DisplayQrState.error([String? message]) = Error;
}
