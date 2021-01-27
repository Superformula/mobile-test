import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:qrcodevalidator/app/pages/display_qr_code/display_qr_code_presenter.dart';
import 'package:qrcodevalidator/app/utils/snackbar.dart';
import 'package:qrcodevalidator/domain/entities/qr_code.dart';
import 'package:qrcodevalidator/domain/repositories/qr_code_repository.dart';

class DisplayGetQRCodeController extends Controller {
  DisplayGetQRCodeController(QRCodeRepository repository)
      : _getQRCodePresenter = DisplayQRCodePresenter(repository);

  DisplayQRCodePresenter _getQRCodePresenter;
  QRCode qrCode;
  bool isLoading = false;
  Duration remainingTime;
  Timer _countdownTimer;
  Timer _scheduleTimer;

  @override
  void initListeners() {
    retrieveData();

    _getQRCodePresenter.getQRCodeOnNext = (QRCode qrCode) {
      this.qrCode = qrCode;
    };

    _getQRCodePresenter.getQRCodeOnComplete = () {
      _updateCountdownTimer();

      _scheduleNextQRCodeFetch();

      _dismissLoading();
    };

    _getQRCodePresenter.getQRCodeOnError = (e) {
      SnackbarUtil.showGenericSnackbar(
        getContext(),
        e.message,
        isError: true,
      );

      _dismissLoading();
    };
  }

  _updateCountdownTimer() {
    _updateRemainingTime();

    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      _updateRemainingTime();
    });
  }

  _updateRemainingTime() {
    remainingTime = qrCode.getRemainingTime(DateTime.now());
    refreshUI();
  }

  _scheduleNextQRCodeFetch() {
    _scheduleTimer = Timer(
      qrCode.getRemainingTime(DateTime.now()),
      retrieveData,
    );
  }

  @override
  onDisposed() {
    _getQRCodePresenter.dispose();
    _countdownTimer?.cancel();
    _scheduleTimer?.cancel();
    super.onDisposed();
  }

  void _dismissLoading() {
    isLoading = false;
    refreshUI();
  }

  void retrieveData() {
    isLoading = true;
    _getQRCodePresenter.getQRCode();
  }
}
