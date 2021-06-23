part of 'qr_page_cubit.dart';

@freezed
abstract class QrPageState with _$QrPageState {
  const factory QrPageState.loading() = _Loading;
  const factory QrPageState.loaded({required Seed seed, required int ttl}) =
      _Loaded;
  const factory QrPageState.loadError({required CommonFailure failure}) =
      _LoadError;
}
