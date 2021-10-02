import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:superformula_mobile_test/domain/display_qr_code/entities/qr_seed.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_repository.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/qr_seed_failure.dart';
import 'package:superformula_mobile_test/locator.dart';

part 'display_qr_code_event.dart';
part 'display_qr_code_state.dart';
part 'display_qr_code_bloc.freezed.dart';

class DisplayQrCodeBloc extends Bloc<DisplayQrCodeEvent, DisplayQrCodeState> {
  final _qrSeedRepository = locator<IQrSeedRepository>();

  DisplayQrCodeBloc() : super(const DisplayQrCodeState.initial());

  @override
  void onChange(Change<DisplayQrCodeState> change) {
    super.onChange(change);
  }

  @override
  Stream<DisplayQrCodeState> mapEventToState(
    DisplayQrCodeEvent event,
  ) async* {
    yield* event.map(
      requestedNewQrCode: (newSeedRequested) async* {
        yield const DisplayQrCodeState.loadInProgress();
        final response = await _qrSeedRepository.getQrCodeSeed();
        yield* response.when(
          left: (left) async* {
            yield DisplayQrCodeState.loadFailure(left);
          },
          right: (right) async* {
            yield DisplayQrCodeState.loadSuccess(right);
          },
        );
      },
      qrCodeExpired: (qrcodeExpired) async* {
        add(const DisplayQrCodeEvent.requestedNewQrCode());
      },
    );
  }
}
