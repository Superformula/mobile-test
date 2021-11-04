part of 'scan_view_bloc.dart';

abstract class ScanViewEvent extends Equatable {
  const ScanViewEvent();
  @override
  List<Object> get props => [];
}

class ValidateSeed extends ScanViewEvent {
  final Barcode seedData;
  const ValidateSeed(this.seedData);
  @override
  List<Object> get props => [seedData];
}

class RestartScanData extends ScanViewEvent {
  const RestartScanData();
  @override
  List<Object> get props => [];
}
