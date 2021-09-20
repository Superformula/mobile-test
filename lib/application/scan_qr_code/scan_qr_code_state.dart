part of 'scan_qr_code_bloc.dart';

@freezed
class ScanQrCodeState with _$ScanQrCodeState {
  const factory ScanQrCodeState({
    required String code,
    required bool isValidating,
    // required bool lastCodeInvalid,
    required bool lastCodeValid,
    required bool showError,
  }) = _ScanQrCodeState;

  factory ScanQrCodeState.initial() => const ScanQrCodeState(
        code: '',
        isValidating: false,
        showError: false,
        lastCodeValid: false,
      );
}
