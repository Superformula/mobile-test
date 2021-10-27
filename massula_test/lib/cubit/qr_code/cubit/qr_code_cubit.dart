import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:massula_test/models/remote/qr_code_seed.dart';
import 'package:massula_test/resources/string_constant.dart';
import 'package:massula_test/services/http/qr_code_web_client.dart';
import 'package:meta/meta.dart';

part 'qr_code_state.dart';

class QrCodeCubit extends Cubit<QrCodeState> {
  final QrCodeWebClient qrCodeWebClient;
  final Random _random = Random();

  QrCodeCubit({required this.qrCodeWebClient}) : super(QrCodeInitial()) {
    getQRCode();
  }

  Future<void> getQRCode() async {
    try {
      emit(QrCodeLoading());

      final QrCodeSeed? qrCodeSeed = await qrCodeWebClient.getQRCode();
      if (qrCodeSeed == null || qrCodeSeed.seed == null) {
        emit(QrCodeError(message: StringConstant.GENERIC_RETRIEVE_ERROR_MESSAGE));
      } else {
        emit(QrCodeLoaded(qrCodeSeed: qrCodeSeed));
      }
    } on TimeoutException catch (e) {
      print('Error: $e');
      emit(QrCodeError(message: StringConstant.GENERIC_MISSING_CONNECTION_ERROR_MESSAGE));
    } catch(e) {
      print('Error: $e');
      emit(QrCodeError(message: StringConstant.GENERIC_RETRIEVE_ERROR_MESSAGE));
    }
  }

  // Generate random string: https://stackoverflow.com/a/61929967/10507546
  String getRandomString(int length) => String.fromCharCodes(
    Iterable.generate(length, (_) => StringConstant.CHARS.codeUnitAt(
      _random.nextInt(StringConstant.CHARS.length)
    ))
  );
}
