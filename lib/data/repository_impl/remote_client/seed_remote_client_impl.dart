import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:qrGenerator/data/api/mapper/seed_model_mapper.dart';
import 'package:qrGenerator/data/api/seed_api.dart';
import 'package:qrGenerator/domain/models/error_bundle.dart';
import 'package:qrGenerator/domain/models/seed.dart';

abstract class SeedRemoteClient {
  Future<Seed> getSeed();
}

/// Transact remote Seed operations with the Seed API endpoint.
class SeedRemoteClientImpl implements SeedRemoteClient {
  static const ResponseTimeout = Duration(seconds: 20);

  // some possible exceptions
  static const int timeoutException = 600;
  static const int genericException = 601;
  static const int flutterError = 602;

  @override
  Future<Seed> getSeed() {
    return SeedApi().getSeed().timeout(ResponseTimeout)
        .then((dto) => SeedModelMapper().map(dto))
        .catchError(handleError);
  }

  void handleError(dynamic error) {
    if (error is TimeoutException) {
      throw ErrorBundle(timeoutException.toString(), _errorMessage(timeoutException));
    }
    if (error is FlutterError) {
      throw ErrorBundle(flutterError.toString(), error.message);
    }
    // catch all others
    ErrorBundle errorBundle = ErrorBundle(genericException.toString(), _errorMessage(genericException));
    throw errorBundle;
  }

  String _errorMessage(int code) {
    switch (code) {
      case timeoutException:
        return "Your request has timed out. Please try again.";
      case genericException:
      default:
        return "Something went wrong on our end. Please try again.";
    }
  }

}

