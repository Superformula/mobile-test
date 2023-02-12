part of 'qr_code_seed_bloc.dart';

abstract class QrCodeSeedState {}

class QrCodeSeedIdleState extends QrCodeSeedState {}

class QrCodeSeedLoadingState extends QrCodeSeedState {}

class QrCodeSeedSuccessState extends QrCodeSeedState {
  QrCodeSeedViewModel viewModel;

  QrCodeSeedSuccessState(this.viewModel);
}

class QrCodeSeedFailedState extends QrCodeSeedState {
  final String message;

  QrCodeSeedFailedState(this.message);
}
