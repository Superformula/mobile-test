import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:qrcodevalidator/domain/entities/qr_code.dart';
import 'package:qrcodevalidator/domain/repositories/qr_code_repository.dart';
import 'package:qrcodevalidator/domain/usecases/get_qr_code_use_case.dart';
import 'package:qrcodevalidator/domain/utils/generic_error.dart';

class DisplayQRCodePresenter extends Presenter {
  Function(QRCode) getQRCodeOnNext;
  Function getQRCodeOnComplete;
  Function(GenericError) getQRCodeOnError;

  final GetQRCodeUseCase getQRCodeUseCase;

  // dependency injection from controller
  DisplayQRCodePresenter(QRCodeRepository repository)
      : getQRCodeUseCase = GetQRCodeUseCase(repository);

  /// getQRCode function called by the controller
  void getQRCode() {
    getQRCodeUseCase.execute(_DisplayQRCodeUseCaseObserver(this));
  }

  /// Disposes of the [GetQRCodeUseCase] and unsubscribes
  @override
  void dispose() {
    getQRCodeUseCase.dispose();
  }
}

/// The [Observer] used to observe the `Stream` of the [GetQRCodeUseCase]
class _DisplayQRCodeUseCaseObserver implements Observer<QRCode> {
  final DisplayQRCodePresenter getQRCodePresenter;

  _DisplayQRCodeUseCaseObserver(this.getQRCodePresenter);

  /// GetQRCode is successful, trigger event in [GetQRCodeController]
  void onNext(qrCode) {
    assert(getQRCodePresenter.getQRCodeOnNext != null);
    getQRCodePresenter.getQRCodeOnNext(qrCode);
  }

  /// GetQRCode is complete, trigger event in [GetQRCodeController]
  void onComplete() {
    assert(getQRCodePresenter.getQRCodeOnComplete != null);
    getQRCodePresenter.getQRCodeOnComplete();
  }

  /// GetQRCode was unsuccessful, trigger event in [GetQRCodeController]
  void onError(e) {
    assert(getQRCodePresenter.getQRCodeOnError != null);
    getQRCodePresenter.getQRCodeOnError(e);
  }
}
