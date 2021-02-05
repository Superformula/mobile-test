import 'package:flutter/foundation.dart';
import 'package:qrGenerator/app/dependency_injection/injector.dart';
import 'package:qrGenerator/app/utils/logger.dart';
import 'package:qrGenerator/data/usecase/get_seed_usecase.dart';
import 'package:qrGenerator/domain/models/error_bundle.dart';
import 'package:qrGenerator/domain/models/seed.dart';

enum ResponseStatus {
  SUCCESS, LOADING, ERROR
}

class QrCodeViewModel extends ChangeNotifier {
  final String _tag = 'QrCodeViewModel';

  // these fields are unused... but still left in for some context
  // (in keeping with the semi-production level nature of this app)
  ResponseStatus _responseStatus;
  ErrorBundle _error;

  GetSeedUseCase _getSeedUseCase;

  Seed _dataModel;
  bool _seedHasExpired = false;

  QrCodeViewModel() {
    _getSeedUseCase = Injector.resolve<GetSeedUseCase>();
  }

  /// Get current Seed
  Seed getSeed() {
    return _dataModel;
  }

  /// Fetch new Seed
  void fetchSeed() {
    var fetch = _getSeedUseCase.getSeed();
    fetch.then((seed) {
      _responseStatus = ResponseStatus.SUCCESS;
      _dataModel = seed;
      Log.i(_tag, 'Successfully fetched Seed: ' + seed.seed);
      notifyListeners();
    }).catchError((e) {
      if (e is ErrorBundle) Log.e(_tag, 'Failed to fetch seed: ' + e.errorMessage);
      _handleError(e);
    });
  }

  /// No joy
  void _handleError(error) {
    this._error = error;
    _responseStatus = ResponseStatus.ERROR;
    notifyListeners();
  }

  setSeedExpiredState(bool expiredState) {
    _seedHasExpired = expiredState;
    notifyListeners();
  }

  bool getSeedExpiredState() {
    return _seedHasExpired;
  }
}