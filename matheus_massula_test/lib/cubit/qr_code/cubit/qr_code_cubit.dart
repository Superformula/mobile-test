import 'package:bloc/bloc.dart';
import 'package:matheus_massula_test/resources/string_constant.dart';
import 'package:meta/meta.dart';

part 'qr_code_state.dart';

class QrCodeCubit extends Cubit<QrCodeState> {
  QrCodeCubit() : super(QrCodeInitial());

  Future<void> getQRCode() async {
    try {
      emit(QrCodeLoading());

      await Future.delayed(Duration(seconds: 3)); //TODO: Replace it by the API Call

      emit(QrCodeLoaded(qrCodeSeed: ''));
    } catch (e) {
      print('Error: $e');
      emit(QrCodeError(message: StringConstant.GENERIC_RETRIEVE_ERRO_MESSAGE));
    }
  }
}
