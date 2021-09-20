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
          yield state.copyWith(code: '', isValidating: true, message: null);
          final validated = await _qrSeedRepository.validateQrCodeData(ev.code);

          yield* validated.when(left: (left) async* {
            yield state.copyWith(
              code: '',
              isValidating: false,
              message: 'Server error. Please try again.',
            );
          }, right: (isValid) async* {
            if (isValid) {
              add(ScanQrCodeEvent.validCodeScanned(ev.code));
            } else {
              add(ScanQrCodeEvent.invalidCodeScanned(ev.code));
            }
          });
        }
      },
      cameraLoadFailed: (ev) async* {
        yield state.copyWith(
          message: 'Unable to access the device camera.',
        );
      },
      invalidCodeScanned: (ev) async* {
        yield state.copyWith(
          code: ev.code,
          isValidating: false,
          message: 'Code is invalid. Please try another code.',
        );
      },
      validCodeScanned: (ev) async* {
        // here we do not enable validation reads again,
        // since we probably will want to change route
        yield state.copyWith(
          code: ev.code,
          message: 'Code is valid ${ev.code}',
          isValidating: false,
        );
      },
    );
  }
}
