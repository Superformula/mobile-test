import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_generator_app/model/seed.dart';

part 'display_qr_state.freezed.dart';

@freezed
class DisplayQrState with _$DisplayQrState {
  const factory DisplayQrState.initial() = Initial;
  const factory DisplayQrState.loading() = Loading;
  const factory DisplayQrState.success(Seed seed) = Success;
  const factory DisplayQrState.error([String? message]) = Error;
}
