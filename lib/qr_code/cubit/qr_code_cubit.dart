import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_repository/qr_code_repository.dart';

part 'qr_code_state.dart';

class QrCodeCubit extends Cubit<QrCodeState> {
  QrCodeCubit({
    required QrCodeRepository qrCodeRepository,
  })  : _qrCodeRepository = qrCodeRepository,
        super(const QrCodeState()) {
    fetchSeed();
  }

  final QrCodeRepository _qrCodeRepository;
  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Future<void> fetchSeed() async {
    try {
      final qrCode = await _qrCodeRepository.getSeed();

      emit(
        state.copyWith(
          status: QrCodeStatus.success,
          qrCode: qrCode,
        ),
      );

      final dateExpiresAt = DateFormat('yyyy-MM-dd HH:mm:ss')
          .parse(qrCode.expiresAt!.toString(), true);

      await _tickerSubscription?.cancel();
      _tickerSubscription = _qrCodeRepository
          .seedCountDown(expireDate: dateExpiresAt)
          .listen((duration) {
        countDown(duration: duration);
      });
    } on SeedRequestException {
      emit(
        state.copyWith(
          status: QrCodeStatus.failure,
        ),
      );
    }
  }

  void countDown({
    required int duration,
  }) {
    if (duration == 0) {
      emit(const QrCodeState());
      fetchSeed();
    } else {
      emit(state.copyWith(duration: duration));
    }
  }
}
