import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_test/domain/use_cases/qr_code_get_seed_use_case.dart';
import 'package:superformula_test/view/mappers/qr_code_seed_view_model_mapper.dart';
import 'package:superformula_test/view/models/qr_code_seed_view_model.dart';

part 'qr_code_seed_state.dart';

class QrCodeSeedCubit extends Cubit<QrCodeSeedState> {
  QrCodeSeedCubit(this.useCase) : super(QrCodeSeedIdleState());

  final QrCodeGetSeedUseCase useCase;

  void getSeed() async {
    emit(QrCodeSeedLoadingState());

    final result = await useCase();

    if (result.isSuccess) {
      final viewModel = QrCodeSeedViewModelMapper.entityToViewModel(
        result.asSuccess.data,
      );

      emit(QrCodeSeedSuccessState(viewModel));
    } else {
      final errorMesage = result.asFailure.failure.message;

      emit(QrCodeSeedFailedState(errorMesage));
    }
  }
}
