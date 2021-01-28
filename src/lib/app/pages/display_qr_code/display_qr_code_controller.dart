import 'dart:async';
import 'dart:convert';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:qrcodevalidator/app/pages/display_qr_code/display_qr_code_presenter.dart';
import 'package:qrcodevalidator/app/utils/snackbar.dart';
import 'package:qrcodevalidator/data/mappers/qr_code_mapper.dart';
import 'package:qrcodevalidator/domain/entities/qr_code.dart';
import 'package:qrcodevalidator/domain/repositories/qr_code_repository.dart';

class DisplayGetQRCodeController extends Controller {
  DisplayGetQRCodeController(QRCodeRepository repository)
      : _getQRCodePresenter = DisplayQRCodePresenter(repository);

  DisplayQRCodePresenter _getQRCodePresenter;
  QRCode qrCode;
  String get qrCodeContent =>
      qrCode != null ? jsonEncode(QRCodeMapper.toMap(qrCode)) : null;
  bool isLoading = false;
  Duration remainingTime;
  Timer _countdownTimer;
  Timer _scheduleTimer;

  @override
  void initListeners() {
    getQRCode();

    _getQRCodePresenter.getQRCodeOnNext = (QRCode qrCode) {
      this.qrCode = qrCode;
    };

    _getQRCodePresenter.getQRCodeOnError = (e) {
      _clearUI();

      _stopCountdownTimer();
      _stopScheduleTimer();

      SnackbarUtil.showGenericSnackbar(
        getContext(),
        e.message,
        isError: true,
      );
    };

    _getQRCodePresenter.getQRCodeOnComplete = () {
      if (qrCode != null) {
        _updateCountdownTimer();

        _scheduleNextQRCodeFetch();
      }

      _dismissLoading();
    };
  }

  /// Get new QR Code.
  void getQRCode() {
    _startLoading();
    _getQRCodePresenter.getQRCode();
  }

  // Clear UI's QR Code and remaining time.
  _clearUI() {
    qrCode = null;
    remainingTime = null;
  }

  // Cancel UI's countdown.
  _stopCountdownTimer() {
    if (_countdownTimer != null) {
      _countdownTimer.cancel();
    }
  }

  /// Cancel scheduled fetch for the next QR Code.
  _stopScheduleTimer() {
    if (_scheduleTimer != null) {
      _scheduleTimer.cancel();
    }
  }

  /// Update UI's countdown text every second with QR Code's remaining time.
  _updateCountdownTimer() {
    _updateRemainingTime() {
      remainingTime = qrCode.getRemainingTime(DateTime.now());
      refreshUI();
    }

    _updateRemainingTime();

    _stopCountdownTimer();

    _countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      _updateRemainingTime();
    });
  }

  /// Schedule next QR Code fetch when current QR Code expires.
  _scheduleNextQRCodeFetch() {
    _scheduleTimer = Timer(
      qrCode.getRemainingTime(DateTime.now()),
      getQRCode,
    );
  }

  /// Display UI's loadind state.
  void _startLoading() {
    isLoading = true;
    refreshUI();
  }

  /// Hide UI's loadind state.
  void _dismissLoading() {
    isLoading = false;
    refreshUI();
  }

  @override
  onDisposed() {
    _getQRCodePresenter.dispose();

    _stopScheduleTimer();
    _stopCountdownTimer();

    super.onDisposed();
  }
}
