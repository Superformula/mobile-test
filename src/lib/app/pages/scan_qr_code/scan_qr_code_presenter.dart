import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:qrcodevalidator/domain/repositories/qr_code_repository.dart';
import 'package:qrcodevalidator/domain/repositories/time_repository.dart';
import 'package:qrcodevalidator/domain/usecases/validate_qr_code_use_case.dart';
import 'package:qrcodevalidator/domain/utils/generic_error.dart';

class ScanQRCodePresenter extends Presenter {
  // dependency injection from controller
  ScanQRCodePresenter(
    QRCodeRepository qrCodeRepository,
    TimeRepository timeRepository,
  ) : getQRCodeUseCase = ValidateQRCodeCodeUseCase(
          qrCodeRepository,
          timeRepository,
        );

  Function(bool) scanQRCodeOnNext;
  // Function scanQRCodeOnComplete;
  Function(GenericError) scanQRCodeOnError;

  final ValidateQRCodeCodeUseCase getQRCodeUseCase;

  /// getQRCode function called by the controller
  void validateQRCode(String qrCodeContent) {
    getQRCodeUseCase.execute(
        _ScanQRCodeUseCaseObserver(this),
        ValidateQRCodeCodeUseCaseParams(
          qrCodeContent: qrCodeContent,
        ));
  }

  /// Disposes of the [ScanQRCodeUseCase] and unsubscribes
  @override
  void dispose() {
    getQRCodeUseCase.dispose();
  }
}

/// The [Observer] used to observe the `Stream` of the [ScanQRCodeUseCase]
class _ScanQRCodeUseCaseObserver implements Observer<bool> {
  _ScanQRCodeUseCaseObserver(
    this.getQRCodePresenter,
  );

  final ScanQRCodePresenter getQRCodePresenter;

  /// ScanQRCode is successful, trigger event in [ScanQRCodeController]
  void onNext(valid) {
    assert(getQRCodePresenter.scanQRCodeOnNext != null);
    getQRCodePresenter.scanQRCodeOnNext(valid);
  }

  /// This event won't be used in this particular case.
  void onComplete() {}

  /// ScanQRCode was unsuccessful, trigger event in [ScanQRCodeController]
  void onError(e) {
    assert(getQRCodePresenter.scanQRCodeOnError != null);
    getQRCodePresenter.scanQRCodeOnError(e);
  }
}
