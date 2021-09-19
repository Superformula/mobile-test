part of 'display_qr_code_bloc.dart';

@freezed
class DisplayQrCodeState with _$DisplayQrCodeState {
  // Default factory for states
  const factory DisplayQrCodeState({
    required QrSeed? qrSeed,
    required bool isLoading,
    required bool hasError,
  }) = _DisplayQrCodeState;

  factory DisplayQrCodeState.initial() =>
      const DisplayQrCodeState(qrSeed: null, isLoading: false, hasError: false);

  const factory DisplayQrCodeState.loadingQrCode({
    required QrSeed? qrSeed,
    required bool isLoading,
    required bool hasError,
  }) = LoadingQrCode;

  const factory DisplayQrCodeState.loadedQrCode({
    required QrSeed? qrSeed,
    required bool isLoading,
    required bool hasError,
  }) = LoadedQrCode;

  const DisplayQrCodeState._();
}
