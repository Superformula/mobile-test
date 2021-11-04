part of 'scan_view_bloc.dart';

//Main state
class ScanViewStateBloc extends Equatable {
  final String seedData;
  final bool seedValidated;
  final bool status;
  final ScanStatus scanStatus;
  final String errorMessage;

  const ScanViewStateBloc(
      {this.seedData,
      this.seedValidated,
      this.status,
      this.errorMessage,
      @required this.scanStatus});
  @override
  List<Object> get props =>
      [seedData, seedValidated, status, scanStatus, errorMessage];
  @override
  String toString() => 'ScanViewLoaded ';
}
