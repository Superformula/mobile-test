import 'dart:async';
import 'dart:convert';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:qrcodevalidator/data/mappers/qr_code_mapper.dart';
import 'package:qrcodevalidator/domain/repositories/qr_code_repository.dart';
import 'package:qrcodevalidator/domain/repositories/time_repository.dart';
import 'package:qrcodevalidator/domain/utils/generic_error.dart';

class ValidateQRCodeCodeUseCase
    extends UseCase<bool, ValidateQRCodeCodeUseCaseParams> {
  ValidateQRCodeCodeUseCase(
    this.qrCodeRepository,
    this.timeRepository,
  ) : super();

  final QRCodeRepository qrCodeRepository;
  final TimeRepository timeRepository;

  @override
  Future<Stream<bool>> buildUseCaseStream(
      ValidateQRCodeCodeUseCaseParams params) async {
    final StreamController<bool> controller = StreamController();

    try {
      var qrCode = QRCodeMapper.fromMap(jsonDecode(params.qrCodeContent));

      var currentTime = await timeRepository.getCurrentTime();

      var isValid = qrCodeRepository.validateQRCode(
        qrCode,
        currentTime,
      );

      controller.add(isValid);

      logger.finest('ValidateQRCodeCodeUseCase successful.');
    } catch (e) {
      print(e);
      logger.severe('ValidateQRCodeCodeUseCase unsuccessful.');

      controller.addError(GenericError(
        'Invalid QR Code',
        exception: e,
      ));
    } finally {
      controller.close();
    }

    return controller.stream;
  }
}

class ValidateQRCodeCodeUseCaseParams {
  String qrCodeContent;

  ValidateQRCodeCodeUseCaseParams({
    this.qrCodeContent,
  });
}
