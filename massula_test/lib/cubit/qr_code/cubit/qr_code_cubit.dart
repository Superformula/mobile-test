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
  final QRCodeWebClient qrCodeWebClient;
  final Random _random = Random();

  QrCodeCubit({required this.qrCodeWebClient}) : super(QrCodeInitial()) {
    getQRCode();
  }

  Future<void> getQRCode() async {
    try {
      emit(QrCodeLoading());

      final QRCodeSeed? qrCodeSeed = await qrCodeWebClient.getQRCode();
      if (qrCodeSeed == null || qrCodeSeed.seed == null) {
        emit(QrCodeError(message: StringConstant.GENERIC_RETRIEVE_ERRO_MESSAGE));
      } else {
        emit(QrCodeLoaded(qrCodeSeed: qrCodeSeed));
      }
    } catch (e) {
      if (e is TimeoutException) {
        emit(
          QrCodeLoaded(
            qrCodeSeed: QRCodeSeed(
              seed: getRandomString(10),
              expiresAt: DateTime.now().add(Duration(seconds: 15))
            )
          )
        );
      } else {
        print('Error: $e');
        emit(QrCodeError(message: StringConstant.GENERIC_RETRIEVE_ERRO_MESSAGE));
      }
    }
  }

  // Generate random string: https://stackoverflow.com/questions/61919395/how-to-generate-random-string-in-dart
  String getRandomString(int length) => String.fromCharCodes(
    Iterable.generate(length, (_) => StringConstant.CHARS.codeUnitAt(
      _random.nextInt(StringConstant.CHARS.length)
    ))
  );
}
