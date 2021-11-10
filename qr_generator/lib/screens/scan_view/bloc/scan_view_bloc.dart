import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_generator/repositories/seed_repository.dart';
part 'scan_view_event.dart';
part 'scan_view_state.dart';

enum ScanStatus { initial, loaded, failure }

class ScanViewBloc extends Bloc<ScanViewEvent, ScanViewStateBloc> {
  final SeedRepository seedRepository;

  ScanViewBloc({
    required this.seedRepository,
  }) : super(ScanViewStateBloc(scanStatus: ScanStatus.initial)) {
    on<ValidateSeed>(
      _onValidateSeed,
    );
    on<RestartScanData>(
      _onRestartScanData,
    );
  }

  ///Inital event
  Future<void> _onValidateSeed(
    ValidateSeed event,
    Emitter<ScanViewStateBloc> emit,
  ) async {
    try {
      //Validating scan data
      bool response =
          await seedRepository.validateSeedData(event.seedData.code);

      emit(ScanViewStateBloc(
          seedData: event.seedData.code,
          status: true,
          seedValidated: response,
          scanStatus: ScanStatus.loaded));
    } catch (e) {
      //Returning error
      emit(ScanViewStateBloc(
          errorMessage: e.toString(), scanStatus: ScanStatus.failure));
    }
  }

  Future<void> _onRestartScanData(
    RestartScanData event,
    Emitter<ScanViewStateBloc> emit,
  ) async {
    try {
      emit(ScanViewStateBloc(
          status: !state.status, scanStatus: ScanStatus.initial));
    } catch (e) {
      //Returning error
      emit(ScanViewStateBloc(
          errorMessage: e.toString(), scanStatus: ScanStatus.failure));
    }
  }
}
