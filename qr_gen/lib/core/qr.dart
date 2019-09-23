import 'package:flutter_observable_state/flutter_observable_state.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_gen/core/models/seed.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_gen/core/services/qr.dart';

enum LoadingState { Idle, Busy, Success, Failure }

class QrState {
  final loading = Observable<LoadingState>(LoadingState.Idle);
  final seed = Observable<Seed>(null);
  final qrCode = Observable<QrImage>(null);
}

class QrActions {
  final _state = GetIt.instance.get<QrState>();
  final _repository = GetIt.instance.get<QrService>();

  Future<void> getSeed() async {
    _state.loading.set(LoadingState.Busy);

    try {
      _state.seed.set(await _repository.getSeed());
    } catch (e) {
      _state.loading.set(LoadingState.Failure);
    }
    _state.loading.set(LoadingState.Success);
  }
}
