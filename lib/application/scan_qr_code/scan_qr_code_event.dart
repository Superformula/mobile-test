part of 'scan_qr_code_bloc.dart';

@freezed
class ScanQrCodeEvent with _$ScanQrCodeEvent {
  const factory ScanQrCodeEvent.started() = _Started;
  const factory ScanQrCodeEvent.qrCodeScanned(String code) = _QrCodeScanned;
  const factory ScanQrCodeEvent.invalidCodeScanned(String code) =
      _InvalidCodeScanned;
  const factory ScanQrCodeEvent.validCodeScanned(String code) =
      _ValidCodeScanned;
  const factory ScanQrCodeEvent.cameraLoadFailed() = _cameraLoadFailed;
}
