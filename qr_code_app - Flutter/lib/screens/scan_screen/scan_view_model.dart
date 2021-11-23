import 'package:flutter/material.dart';
import 'package:qr_generator/models/seed.dart';
import 'package:qr_generator/screens/scan_screen/scan_repository.dart';

class ScanViewModel {
  bool _isLoading = false;

  Future<Object?> verifyQr(
    String? seed,
  ) async {
    var commentResponse;

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _isLoading = true;
    });

    try {
      if (seed == null) throw UnknownException();

      commentResponse = await ScanRepository().verifyQr(Seed(seed, ""));
    } catch (exception) {
      commentResponse = null;
    }

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _isLoading = false;
    });

    return commentResponse;
  }

  clearData() {
    _isLoading = false;
  }
}

class UnknownException extends ApiException {}

abstract class ApiException implements Exception {}
