import 'package:bloc/bloc.dart';
import 'package:matheus_massula_test/models/remote/qr_code_seed.dart';
import 'package:matheus_massula_test/resources/string_constant.dart';
import 'package:matheus_massula_test/services/http/qr_code_web_client.dart';
import 'package:meta/meta.dart';

part 'qr_code_state.dart';

class QrCodeCubit extends Cubit<QrCodeState> {
  final QRCodeWebClient qrCodeWebClient;

  QrCodeCubit({required this.qrCodeWebClient}) : super(QrCodeInitial());

  Future<void> getQRCode() async {
    try {
      emit(QrCodeLoading());

      final QRCodeSeed? qrCodeSeed = await qrCodeWebClient.getQRCode();
      if (qrCodeSeed == null) {
        throw Exception();
      }

      emit(QrCodeLoaded(qrCodeSeed: qrCodeSeed));
    } catch (e) {
      print('Error: $e');
      emit(QrCodeError(message: StringConstant.GENERIC_RETRIEVE_ERRO_MESSAGE));
    }
  }
}
