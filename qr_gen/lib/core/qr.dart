import 'package:flutter_observable_state/flutter_observable_state.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_gen/core/models/seed.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_gen/core/services/qr.dart';

enum LoadingState { Idle, Busy, Success, Failure }

class QrState {
  final _loading = Observable<LoadingState>(LoadingState.Idle);
  final _seed = Observable<Seed>(null);
  final _qrCode = Observable<QrImage>(null);

  LoadingState get loading => _loading.get();
  set loading(LoadingState state) => _loading.set(state);

  Seed get seed => _seed.get();
  set seed(Seed seed) => _seed.set(seed);

  QrImage get qrCode => _qrCode.get();
  set qrCode(QrImage qrCode) => _qrCode.set(qrCode);
}

class QrActions {
  final _state = GetIt.instance.get<QrState>();
  final _repository = GetIt.instance.get<QrService>();

  Future<void> getSeed() async {
    _state.loading = LoadingState.Busy;

    try {
      _state.seed = await _repository.getSeed();
      _state.loading = LoadingState.Success;
    } catch (e) {
      _state.loading = LoadingState.Failure;
    }
  }
}
