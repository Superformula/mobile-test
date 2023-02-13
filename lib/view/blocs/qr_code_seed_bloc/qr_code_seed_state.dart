part of 'qr_code_seed_bloc.dart';

abstract class QrCodeSeedState extends Equatable {
  const QrCodeSeedState();
}

class QrCodeSeedIdleState extends QrCodeSeedState {
  @override
  List<Object?> get props => [];
}

class QrCodeSeedLoadingState extends QrCodeSeedState {
  const QrCodeSeedLoadingState();

  @override
  List<Object?> get props => [];
}

class QrCodeSeedSuccessState extends QrCodeSeedState {
  final QrCodeSeedViewModel viewModel;

  const QrCodeSeedSuccessState(this.viewModel);

  @override
  List<Object?> get props => [viewModel];
}

class QrCodeSeedFailedState extends QrCodeSeedState {
  final String message;

  const QrCodeSeedFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
