import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_repository.dart';

part 'scan_qr_code_bloc.freezed.dart';
part 'scan_qr_code_event.dart';
part 'scan_qr_code_state.dart';

class ScanQrCodeBloc extends Bloc<ScanQrCodeEvent, ScanQrCodeState> {
  final IQrSeedRepository _qrSeedRepository;
  ScanQrCodeBloc(this._qrSeedRepository) : super(ScanQrCodeState.initial());

  @override
  void onChange(Change<ScanQrCodeState> change) {
    super.onChange(change);
  }

  @override
  Stream<ScanQrCodeState> mapEventToState(
    ScanQrCodeEvent event,
  ) async* {
    yield* event.map(
      started: (ev) async* {},
      qrCodeScanned: (ev) async* {
        if (!state.isValidating) {
          // loading
          yield state.copyWith(code: '', isValidating: true, message: null);
          final validated = await _qrSeedRepository.validateQrCodeData(ev.code);

          // If something wrong happens during the request
          yield* validated.when(left: (left) async* {
            yield* left.when(unexpected: () async* {
              yield errorMessage(
                  'Unexpected error while validating. Pleasse try again');
            }, serverFailure: () async* {
              yield errorMessage('Server error. Please try again.');
            }, cacheFailure: () async* {
              // empty, never called. There is no cache for validation
            }, connectivityFailure: () async* {
              yield errorMessage(
                  'Internet Connection is necessary to validate.');
            });

            // If the request was successful and got a valis response
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
        // here we probably sant to change routes
        // would be wise to prevent further readings
        yield state.copyWith(
          code: ev.code,
          message: 'Code is valid ${ev.code}',
          isValidating: false,
        );
      },
    );
  }

  ScanQrCodeState errorMessage(String message) {
    return state.copyWith(
      code: '',
      isValidating: false,
      message: message,
    );
  }
}
