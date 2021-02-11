import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:qr_app/models/seed_data.dart';
import 'package:qr_app/repositories/seed_repository.dart';
import 'package:qr_app/route_names.dart';
import 'package:qr_app/services/navigation_service.dart';
import 'package:rxdart/subjects.dart';

final getIt = GetIt.instance;

class SeedBloc {
  final _seedBehavSub = BehaviorSubject<SeedData>();
  final _countDownBehavSub = BehaviorSubject<int>();
  Timer _timer;

  NavigationService get _navigationService => getIt<NavigationService>();
  SeedRepository get _seedRepository => getIt<SeedRepository>();

  Stream<SeedData> get seedData => _seedBehavSub.stream;
  Stream<int> get countDownValue => _countDownBehavSub.stream;

  Future<void> navToQRCode() async {
    _navigationService.navigate(RouteNames.Code);
    try {
      await _retrieveSeedSetTimer();
    } catch (e) {
      _seedBehavSub.sink.addError(e);
    }
  }

  void navToScan() {
    _navigationService.navigate(RouteNames.Scan);
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
    _seedBehavSub.sink.add(null);
  }

  Future<void> _retrieveSeedSetTimer() async {
    _timer?.cancel();
    _seedBehavSub.sink.add(null);

    final seedData = await _seedRepository.retrieve();
    var seconds = seedData.retrieveTimeSpan();

    _seedBehavSub.sink.add(seedData);
    _countDownBehavSub.sink.add(seconds);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      seconds--;
      _countDownBehavSub.sink.add(seconds);
      if (seconds == 0) {
        _retrieveSeedSetTimer();
        return;
      }
    });
  }

  dispose() {
    _seedBehavSub?.close();
    _countDownBehavSub?.close();
    _timer?.cancel();
  }
}
