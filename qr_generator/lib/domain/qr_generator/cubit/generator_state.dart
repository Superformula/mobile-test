part of 'generator_cubit.dart';

abstract class GeneratorState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GeneratorInitial extends GeneratorState {}

class GeneratedQR extends GeneratorState {
  GeneratedQR({
    required this.qrData,
    required this.secondsToExpire,
  });

  final String qrData;
  final int secondsToExpire;

  @override
  List<Object> get props => [qrData, secondsToExpire];
}

class GeneratorError extends GeneratorState {
  GeneratorError({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
