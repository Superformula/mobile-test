part of './scanner_cubit.dart';

abstract class ScannerState extends Equatable {
  @override
  List<Object> get props => [];
}

class ScannerInitial extends ScannerState {}

class ValidScanState extends ScannerState {
  ValidScanState({
    required this.scanValue,
  });

  final Barcode scanValue;

  @override
  List<Object> get props => [scanValue];
}
