part of 'display_qr_code_bloc.dart';

@freezed
class DisplayQrCodeEvent with _$DisplayQrCodeEvent {
  const factory DisplayQrCodeEvent.started() = _Started;

  const factory DisplayQrCodeEvent.requestNewQrCode() = _RequestNewQrCode;
  const factory DisplayQrCodeEvent.qrCodeExpired() = _QrCodeExpired;
  // const factory DisplayQrCodeEvent.tickTimer() = _tickTimer;
}
