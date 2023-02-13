part of 'qr_code_validation_bloc.dart';

abstract class QrCodeValidationState {
  const QrCodeValidationState();
}

class QrCodeValidationIdleState extends QrCodeValidationState {}

class QrCodeValidationLoadingState extends QrCodeValidationState {
  final String data;

  const QrCodeValidationLoadingState(this.data);
}

class QrCodeValidationSuccessState extends QrCodeValidationState {
  final bool isValid;
  final String data;

  const QrCodeValidationSuccessState(this.isValid, {required this.data});
}
