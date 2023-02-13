import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_test/domain/use_cases/qr_code_validation_use_case.dart';

part 'qr_code_validation_state.dart';

class QrCodeValidationCubit extends Cubit<QrCodeValidationState> {
  QrCodeValidationCubit(
    this.qrCodeValidationUseCase,
  ) : super(QrCodeValidationIdleState());

  final QrCodeValidationUseCase qrCodeValidationUseCase;

  void validateQRCode(String data) async {
    emit(QrCodeValidationLoadingState(data));

    final result = await qrCodeValidationUseCase();

    if (result.isSuccess) {
      emit(QrCodeValidationSuccessState(result.asSuccess.data, data: data));
    } else {
      emit(
        const QrCodeValidationFailedState(
          'It was not possible to validate the QR Code',
        ),
      );
    }
  }
}
