import 'dart:async';
import 'package:qrcode_app/domain/entities/seed.dart';
import 'package:qrcode_app/domain/repository/seed_repository.dart';
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
    _controller.add(_seedState);
  }

  updateTicker(int value) async {
    _tickController.add(value);
    if (value == 0) {
      _tickerSubscription?.cancel();
      await getData();
    }
  }

  @override
  Future getData() async {
    _controller.add(LoadingState());
    _seedState.seed = await repository.getSeed();
    tick(_seedState.seed.expirationDate);
    update();
  }

  void dispose() {
    _controller.close();
    _tickController.close();
    _tickerSubscription?.cancel();
  }

  void tick(DateTime expirationDate) {
    Duration difference = Duration(seconds: -(_seedState.seed.duration - 1));
    if (_tickerSubscription != null) {
      _tickerSubscription!.cancel();
    }
    _tickerSubscription = _ticker
        .tick(difference.inSeconds)
        .listen((duration) => updateTicker(duration.abs()));
  }

  Stream<PresenterState> get streamData => _controller.stream;
  Stream<int> get expirationData => _tickController.stream;
}
