import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile_test_app/model/qr_code.dart';
import 'package:mobile_test_app/repository/qr_repository.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  final QrRepository _repository;

  QrCubit({
    @required QrRepository repository,
  })  : _repository = repository,
        super(QrInitial(true));

  Future<void> generateQrCode() async {
    emit(QrLoading(autoGenerate: state.autoGenerate));
    final qrCode = await _repository.seed();
    emit(QrGenerated(qrCode: qrCode, autoGenerate: state.autoGenerate));
    if (state.autoGenerate) {
      final difference = qrCode.expiresAt.difference(DateTime.now());
      Future.delayed(difference).then((_) {
        if (state.autoGenerate) {
          // make sure it hasn't been disabled during the delay
          generateQrCode();
        }
      });
    }
  }

  void setAutoRefresh(bool value) async {
    if (state is QrGenerated) {
      emit((state as QrGenerated).copyWith(autoGenerate: value));
    } else {
      emit(state);
    }
  }
}
