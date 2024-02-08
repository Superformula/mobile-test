part of 'scan_cubit.dart';

sealed class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object> get props => [];
}

final class ScanInitialState extends ScanState {
  const ScanInitialState();
}

final class ScanningState extends ScanState {
  const ScanningState();
}

final class ScanErrorState extends ScanState {
  const ScanErrorState({required this.errorMessage});

  final String errorMessage;
}

final class ScannedDataState extends ScanState {
  const ScannedDataState({required this.data});

  final String data;

  @override
  List<Object> get props => [data];
}
