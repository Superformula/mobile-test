import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_repository.dart';

part 'scan_qr_code_event.dart';
part 'scan_qr_code_state.dart';
part 'scan_qr_code_bloc.freezed.dart';

class ScanQrCodeBloc extends Bloc<ScanQrCodeEvent, ScanQrCodeState> {
  final IQrSeedRepository _qrSeedRepository;
  ScanQrCodeBloc(this._qrSeedRepository) : super(ScanQrCodeState.initial());

  @override
  void onChange(Change<ScanQrCodeState> change) {
    super.onChange(change);
    // print(change.toString());
  }

  @override
  Stream<ScanQrCodeState> mapEventToState(
    ScanQrCodeEvent event,
  ) async* {
    yield* event.map(
      started: (ev) async* {},
      qrCodeScanned: (ev) async* {
        if (!state.isValidating) {
          yield state.copyWith(isValidating: true);
          final validated = await _qrSeedRepository.validateQrCodeData(ev.code);

          validated.when(left: (left) {
            add(ScanQrCodeEvent.invalidCodeScanned(ev.code));
          }, right: (isValid) {
            if (isValid) {
              add(ScanQrCodeEvent.validCodeScanned(ev.code));
            } else {
              add(ScanQrCodeEvent.invalidCodeScanned(ev.code));
            }
          });
        }
      },
      cameraLoadFailed: (ev) async* {},
      invalidCodeScanned: (ev) async* {
        yield state.copyWith(
          code: ev.code,
          isValidating: false,
          lastCodeValid: false,
        );
      },
      validCodeScanned: (ev) async* {
        // here we do not enable validation reads again,
        // since we probably will want to change route
        yield state.copyWith(
          code: ev.code,
          lastCodeValid: true,
          isValidating: false,
        );
      },
    );
  }
}
