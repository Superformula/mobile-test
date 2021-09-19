part of 'display_qr_code_bloc.dart';

@freezed
class DisplayQrCodeEvent with _$DisplayQrCodeEvent {
  const factory DisplayQrCodeEvent.requestedNewQrCode() = _RequestedNewQrCode;
  const factory DisplayQrCodeEvent.qrCodeExpired() = _QrCodeExpired;
}
