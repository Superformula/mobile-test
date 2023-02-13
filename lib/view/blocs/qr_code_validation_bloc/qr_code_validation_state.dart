part of 'qr_code_validation_bloc.dart';

abstract class QRCodeValidationState {
  const QRCodeValidationState();
}

class QRCodeValidationIdleState extends QRCodeValidationState {}

class QRCodeValidationLoadingState extends QRCodeValidationState {
  final String data;

  const QRCodeValidationLoadingState(this.data);
}

class QRCodeValidationSuccessState extends QRCodeValidationState {
  final bool isValid;
  final String data;

  const QRCodeValidationSuccessState(this.isValid, {required this.data});
}
