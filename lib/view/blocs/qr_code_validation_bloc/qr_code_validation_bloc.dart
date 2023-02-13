import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_test/domain/use_cases/qr_code_validation_use_case.dart';

part 'qr_code_validation_state.dart';

class QRCodeValidationCubit extends Cubit<QRCodeValidationState> {
  QRCodeValidationCubit(
    this.qrCodeValidationUseCase,
  ) : super(QRCodeValidationIdleState());

  final QRCodeValidationUseCase qrCodeValidationUseCase;

  void validateQRCode(String data) async {
    emit(QRCodeValidationLoadingState(data));

    final result = await qrCodeValidationUseCase();

    if (result.isSuccess) {
      emit(QRCodeValidationSuccessState(result.asSuccess.data, data: data));
    }
  }
}
