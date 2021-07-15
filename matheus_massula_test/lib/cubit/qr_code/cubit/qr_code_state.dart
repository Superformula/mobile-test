part of 'qr_code_cubit.dart';

@immutable
abstract class QrCodeState {
  const QrCodeState();
}

class QrCodeInitial extends QrCodeState {
  const QrCodeInitial();
}

class QrCodeLoading extends QrCodeState {
  const QrCodeLoading();
}

class QrCodeLoaded extends QrCodeState {
  final QRCodeSeed qrCodeSeed;

  const QrCodeLoaded({required this.qrCodeSeed});

  @override
  bool operator ==(Object o){
    if(identical(this, o)) return true;
    return o is QrCodeLoaded && o.qrCodeSeed.hashCode == qrCodeSeed.hashCode;
  }

  @override
  int get hashCode => qrCodeSeed.hashCode;
}

class QrCodeError extends QrCodeState {
  final String message;

  const QrCodeError({required this.message});

  @override
  bool operator ==(Object o){
    if(identical(this, o)) return true;
    return o is QrCodeError && o.message.hashCode == message.hashCode;
  }

  @override
  int get hashCode => message.hashCode;
}