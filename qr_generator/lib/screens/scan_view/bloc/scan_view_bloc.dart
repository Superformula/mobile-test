import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_generator/repositories/seed_repository.dart';
part 'scan_view_event.dart';
part 'scan_view_state.dart';

enum ScanStatus { initial, loaded, failure }

class ScanViewBloc extends Bloc<ScanViewEvent, ScanViewStateBloc> {
  final SeedRepository _seedRepository;

  ScanViewBloc(
    SeedRepository seedRepository,
  )   : assert(seedRepository != null),
        _seedRepository = seedRepository,
        super(ScanViewStateBloc(scanStatus: ScanStatus.loaded));

  @override
  Stream<ScanViewStateBloc> mapEventToState(ScanViewEvent event) async* {
    if (event is ValidateSeed) {
      try {
        //Validating scan data
        bool response =
            await _seedRepository.validateSeedData(event.seedData.code);

        yield ScanViewStateBloc(
            seedData: event.seedData.code,
            status: true,
            seedValidated: response,
            scanStatus: ScanStatus.loaded);
      } catch (e) {
        //Returning error
        yield ScanViewStateBloc(
            errorMessage: e.toString(), scanStatus: ScanStatus.failure);
      }
    }
    //Cleaning all state data
    if (event is RestartScanData) {
      try {
        yield ScanViewStateBloc(
            status: !state.status ?? true, scanStatus: ScanStatus.loaded);
      } catch (e) {
        //Returning error
        yield ScanViewStateBloc(
            errorMessage: e.toString(), scanStatus: ScanStatus.failure);
      }
    }
  }
}
