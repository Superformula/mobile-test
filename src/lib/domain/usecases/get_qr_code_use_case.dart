import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:qrcodevalidator/domain/entities/qr_code.dart';
import 'package:qrcodevalidator/domain/repositories/qr_code_repository.dart';
import 'package:qrcodevalidator/domain/utils/generic_error.dart';

class GetQRCodeUseCase extends UseCase<QRCode, void> {
  GetQRCodeUseCase(this.repository) : super();

  final QRCodeRepository repository;

  @override
  Future<Stream<QRCode>> buildUseCaseStream(void ignore) async {
    final StreamController<QRCode> controller = StreamController();

    try {
      var qrCode = await repository.getQRCode();
      controller.add(qrCode);
      logger.finest('GetQRCodeUseCase successful.');
    } catch (e) {
      print(e);
      logger.severe('GetQRCodeUseCase unsuccessful.');
      controller.addError(GenericError(
        'Error retrieving QR Code',
        exception: e,
      ));
    } finally {
      controller.close();
    }

    return controller.stream;
  }
}
