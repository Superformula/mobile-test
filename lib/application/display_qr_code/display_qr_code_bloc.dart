import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/entities/qr_seed.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_repository.dart';

part 'display_qr_code_event.dart';
part 'display_qr_code_state.dart';
part 'display_qr_code_bloc.freezed.dart';

class DisplayQrCodeBloc extends Bloc<DisplayQrCodeEvent, DisplayQrCodeState> {
  final IQrSeedRepository _qrSeedRepository;

  DisplayQrCodeBloc(this._qrSeedRepository)
      : super(DisplayQrCodeState.initial());

  @override
  void onChange(Change<DisplayQrCodeState> change) {
    super.onChange(change);
    // print(change.toString());
  }

  @override
  Stream<DisplayQrCodeState> mapEventToState(
    DisplayQrCodeEvent event,
  ) async* {
    yield* event.map(
        started: (ev) async* {
          // _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => everySecond());
        },
        requestNewQrCode: (ev) async* {
          yield DisplayQrCodeState.loadingQrCode(
              qrSeed: state.qrSeed, isLoading: true, hasError: false);
          final newQrSeed = await _qrSeedRepository.getQrCodeSeed();

          yield newQrSeed.when(
            left: (left) {
              return state.copyWith(isLoading: false, hasError: true);
            },
            right: (right) {
              return DisplayQrCodeState.loadedQrCode(
                  qrSeed: right, isLoading: false, hasError: false);
            },
          );
        },
        qrCodeExpired: (ev) async* {});
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
