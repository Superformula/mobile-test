part of 'qr_code_cubit.dart';

sealed class QrCodeState extends Equatable {
  const QrCodeState();

  @override
  List<Object> get props => [];
}

final class QrCodeInitialState extends QrCodeState {
  const QrCodeInitialState();
}

final class QrCodeLoadingState extends QrCodeState {
  const QrCodeLoadingState();
}

final class QrCodeErrorState extends QrCodeState {
  const QrCodeErrorState({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}

final class QrCodeLoadedState extends QrCodeState {
  const QrCodeLoadedState({required this.qrCodeEntity});
  final QrCodeEntity qrCodeEntity;
  @override
  List<Object> get props => [qrCodeEntity];
}
