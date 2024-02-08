import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/entities/qr_code_entity.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/usecases/get_qr_code/get_qr_code_usecase.dart';

part 'qr_code_state.dart';

final class QrCodeCubit extends Cubit<QrCodeState> {
  QrCodeCubit({required GetQrCodeUsecase getQrCodeUsecase})
      : _getQrCodeUsecase = getQrCodeUsecase,
        super(const QrCodeInitialState());

  final GetQrCodeUsecase _getQrCodeUsecase;

  Future<void> getQrCode() async {
    emit(const QrCodeLoadingState());
    final qrCodeEither = await _getQrCodeUsecase();
    qrCodeEither.fold((failure) {
      emit(QrCodeErrorState(errorMessage: failure.message));
    }, (qrCodeEntity) {
      emit(QrCodeLoadedState(qrCodeEntity: qrCodeEntity));
    });
  }
}
