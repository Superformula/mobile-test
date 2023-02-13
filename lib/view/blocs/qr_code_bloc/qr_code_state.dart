part of 'qr_code_bloc.dart';

abstract class QRCodeState extends Equatable {
  const QRCodeState();
}

class QRCodeIdleState extends QRCodeState {
  @override
  List<Object?> get props => [];
}

class QRCodeLoadingState extends QRCodeState {
  const QRCodeLoadingState();

  @override
  List<Object?> get props => [];
}

class QRCodeSuccessState extends QRCodeState {
  final QRCodeViewModel viewModel;

  const QRCodeSuccessState(this.viewModel);

  @override
  List<Object?> get props => [viewModel];
}

class QRCodeFailedState extends QRCodeState {
  final String message;

  const QRCodeFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
