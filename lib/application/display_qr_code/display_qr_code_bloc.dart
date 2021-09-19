import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/entities/qr_seed.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_repository.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/qr_seed_failure.dart';

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
      requestedNewQrCode: (newSeedRequested) async* {
        yield const DisplayQrCodeState.loadInProgress();
        final response = await _qrSeedRepository.getQrCodeSeed();
        yield response.when(
          left: (l) => DisplayQrCodeState.loadFailure(l),
          right: (r) => DisplayQrCodeState.loadSuccess(r),
        );
      },
      qrCodeExpired: (qrcodeExpired) async* {
        add(const DisplayQrCodeEvent.requestedNewQrCode());
        // bool isConnected = await _networkInfo.isConnected;
        // if (isConnected) {
        //   add(const DisplayQrCodeEvent.newSeedRequested());
        // }
      },
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
