import 'dart:async';

import 'package:qrcode_app/data/repositories/seeds_repository.dart';
import 'package:qrcode_app/domain/entities/seed.dart';
import 'package:qrcode_app/presentation/ticker.dart';

abstract class Presenter {
  bool isValid();
  void update();
  Future getData();
}

abstract class PresenterState {
  late Seed seed;
}

class SeedState extends PresenterState {
  late Seed seed;
  bool? isValid;
}

class LoadingState extends PresenterState {}

class FailureState extends PresenterState {}

class SeedPresenter implements Presenter {
  final SeedRepository repository;
  var _seedState = SeedState();
  StreamController<PresenterState> _controller =
      StreamController<PresenterState>.broadcast();
  StreamController<int> _tickController = StreamController<int>.broadcast();
  SeedPresenter(this._ticker, {required this.repository});
  StreamSubscription<int>? _tickerSubscription;
  final Ticker _ticker;
  @override
  bool isValid() {
    return _seedState.seed.expirationDate.isAfter(DateTime.now());
  }

  @override
  void update() {
    print('updating seed state');
    _controller.add(_seedState);
  }

  updateTicker(int value) {
    print('updating ticker $value');
    _tickController.add(value);
    if (value == 0) _tickerSubscription!.cancel();
  }

  @override
  Future getData() async {
    _controller.add(LoadingState());
    _seedState.seed = await repository.getSeed();
    update();
    tick(_seedState.seed.expirationDate);
  }

  void dispose() {
    print('disposing presenter');
    _controller.close();
    _tickController.close();
  }

  void tick(DateTime expirationDate) {
    Duration difference = DateTime.now().difference(expirationDate);
    if (_tickerSubscription != null) _tickerSubscription!.cancel();
    _tickerSubscription = _ticker
        .tick(difference.inSeconds)
        .listen((duration) => updateTicker(duration.abs()));
  }

  Stream<PresenterState> get streamData => _controller.stream;
  Stream<int> get expirationData => _tickController.stream;
}
