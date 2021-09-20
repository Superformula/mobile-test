part of 'scan_qr_code_bloc.dart';

@freezed
class ScanQrCodeState with _$ScanQrCodeState {
  const factory ScanQrCodeState({
    required String code,
    required bool isValidating,
    required String? message,
  }) = _ScanQrCodeState;

  factory ScanQrCodeState.initial() => const ScanQrCodeState(
        code: '',
        isValidating: false,
        message: null,
      );
}
