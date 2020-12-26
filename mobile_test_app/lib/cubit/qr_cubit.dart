import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:mobile_test_app/model/qr_code.dart';
import 'package:mobile_test_app/repository/qr_repository.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  final QrRepository _repository;

  QrCubit({
    @required QrRepository repository,
  })  : _repository = repository,
        super(QrInitial());

  Future<void> generateQrCode() async {
    emit(QrLoading());
    final qrCode = await _repository.seed();
    emit(QrGenerated(qrCode));
  }
}
