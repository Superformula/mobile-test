import 'dart:async';
import 'dart:io';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcodevalidator/app/pages/scan_qr_code/scan_qr_code_presenter.dart';
import 'package:qrcodevalidator/app/utils/snackbar.dart';
import 'package:qrcodevalidator/domain/repositories/qr_code_repository.dart';
import 'package:qrcodevalidator/domain/repositories/time_repository.dart';

class ScanQRCodeController extends Controller {
  ScanQRCodeController(
    QRCodeRepository qrCodeRepository,
    TimeRepository timeRepository,
  ) : _scanQRCodePresenter = ScanQRCodePresenter(
          qrCodeRepository,
          timeRepository,
        );

  ScanQRCodePresenter _scanQRCodePresenter;
  QRViewController qrViewController;
  bool showValidation = false;
  bool currentValidation;
  Timer _hideValidationTimer;

  final validationAnimationDuration = Duration(milliseconds: 200);

  @override
  void initListeners() {
    // Displays the state of the validation when pointint the camera
    // to the QR Code. If the user is not pointing, will wait a few seconds
    // before hiding the state of the validation.
    _scanQRCodePresenter.scanQRCodeOnNext = (bool valid) {
      currentValidation = valid;

      // Show validation in the UI.
      showValidation = true;
      refreshUI();

      // Cancel previous timer if applicable. There can be only
      // one timer rolling on.
      if (_hideValidationTimer != null) {
        _hideValidationTimer.cancel();
      }

      // Wait before hiding the display verification.
      _hideValidationTimer = Timer(Duration(seconds: 2), () {
        // Hide validation from the UI.
        showValidation = false;
        refreshUI();
      });
    };

    _scanQRCodePresenter.scanQRCodeOnError = (e) {
      SnackbarUtil.showGenericSnackbar(
        getContext(),
        e.message,
        isError: true,
      );
    };
  }

  void initQrViewController(QRViewController qrViewController) {
    this.qrViewController = qrViewController;
    // Listen for QR Code reads. Will read continuously
    // until the camera stops pointing at the QR Code.
    this.qrViewController.scannedDataStream.listen((scanData) {
      _scanQRCodePresenter.validateQRCode(scanData.code);
    });
  }

  /// Toggle camera's flash.
  void toggleFlash() {
    qrViewController?.toggleFlash();
    refreshUI();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void onReassembled() {
    if (Platform.isAndroid) {
      qrViewController.pauseCamera();
    } else if (Platform.isIOS) {
      qrViewController.resumeCamera();
    }

    super.onReassembled();
  }

  @override
  void onDisposed() {
    qrViewController?.dispose();
    _hideValidationTimer?.cancel();

    super.onDisposed();
  }
}
