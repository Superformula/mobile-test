import 'package:bloc/bloc.dart';
import 'package:mobile_test/base/result_state.dart';

class ScanQrCubit extends Cubit<ResultState<String>> {
  ScanQrCubit() : super(const Initial());

  void scanQrCodeSuccess(String code) {
    emit(ResultState.data(code));
  }

  void scanQrCodeFailure(String message) {
    emit(ResultState.error(message));
  }
}
