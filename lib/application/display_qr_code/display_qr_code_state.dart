part of 'display_qr_code_bloc.dart';

@freezed
class DisplayQrCodeState with _$DisplayQrCodeState {
  const factory DisplayQrCodeState.initial() = _Initial;
  const factory DisplayQrCodeState.loadInProgress() = _LoadInProgress;
  const factory DisplayQrCodeState.loadSuccess(QrSeed qrcode) = _LoadSuccess;
  const factory DisplayQrCodeState.loadFailure(QrSeedFailure qrcodeFailure) =
      _LoadFailure;
}
