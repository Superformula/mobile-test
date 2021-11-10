part of 'scan_view_bloc.dart';

///Main state
class ScanViewStateBloc extends Equatable {
  final String seedData;
  final bool seedValidated;
  final bool status;
  final ScanStatus scanStatus;
  final String errorMessage;

  const ScanViewStateBloc({
    required this.scanStatus,
    this.seedData = '',
    this.seedValidated = false,
    this.status = true,
    this.errorMessage = 'Error',
  });
  @override
  List<Object> get props =>
      [seedData, seedValidated, status, scanStatus, errorMessage];
  @override
  String toString() => 'ScanViewLoaded ';
}
