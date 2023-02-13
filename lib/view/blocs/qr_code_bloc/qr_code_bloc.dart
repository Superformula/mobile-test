import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_test/domain/use_cases/qr_code_get_seed_use_case.dart';
import 'package:superformula_test/view/mappers/qr_code_view_model_mapper.dart';
import 'package:superformula_test/view/models/qr_code_view_model.dart';

part 'qr_code_state.dart';

class QRCodeCubit extends Cubit<QRCodeState> {
  QRCodeCubit(this.useCase) : super(const QRCodeIdleState());

  final QRCodeGetSeedUseCase useCase;

  void getSeed() async {
    emit(const QRCodeLoadingState());

    final result = await useCase();

    if (result.isSuccess) {
      final viewModel = QRCodeViewModelMapper.entityToViewModel(
        result.asSuccess.data,
      );

      emit(QRCodeSuccessState(viewModel));
    } else {
      final errorMesage = result.asFailure.failure.message;

      emit(QRCodeFailedState(errorMesage));
    }
  }
}
