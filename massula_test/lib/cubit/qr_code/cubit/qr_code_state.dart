part of 'qr_code_cubit.dart';

@immutable
abstract class QrCodeState extends Equatable {
  const QrCodeState();

  @override
  List<Object?> get props => [];
}

class QrCodeInitial extends QrCodeState {
  const QrCodeInitial();

  @override
  List<Object?> get props => [];
}

class QrCodeLoading extends QrCodeState {
  const QrCodeLoading();

  @override
  List<Object?> get props => [];
}

class QrCodeLoaded extends QrCodeState {
  final QrCodeSeed qrCodeSeed;

  const QrCodeLoaded({required this.qrCodeSeed});

  @override
  List<Object?> get props => [qrCodeSeed];
}

class QrCodeError extends QrCodeState {
  final String message;

  const QrCodeError({required this.message});

  @override
  List<Object?> get props => [message];
}