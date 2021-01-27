import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:qrcodevalidator/domain/entities/qr_code.dart';
import 'package:qrcodevalidator/domain/repositories/qr_code_repository.dart';

class GetQRCodeUseCase extends UseCase<QRCode, void> {
  QRCodeRepository repository;
  GetQRCodeUseCase(this.repository) : super();

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
      controller.addError(e);
    } finally {
      controller.close();
    }

    return controller.stream;
  }
}
