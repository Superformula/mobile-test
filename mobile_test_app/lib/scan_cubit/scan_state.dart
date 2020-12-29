part of 'scan_cubit.dart';

@immutable
abstract class ScanState extends Equatable {
  @override
  List<Object> get props => [];
}

class ScanInitial extends ScanState {}

class ScannedState extends ScanState {}

class CodeValidState extends ScannedState {}

class CodeValidatingState extends ScanState {}

class CodeInvalidState extends ScannedState {}
