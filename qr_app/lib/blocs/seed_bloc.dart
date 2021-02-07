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
    _seedBehavSub.sink.add(null);
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
  }

  Future<void> _retrieveSeedSetTimer() async {
    _timer?.cancel();

    final seedData = await _seedRepository.retrieve();

    Duration difference = seedData.dateTimeObject.difference(DateTime.now());

    final seconds = difference.inSeconds;
    _countDownBehavSub.sink.add(seconds);

    _timer = Timer.periodic(Duration(seconds: seconds), (timer) {
      if (timer.tick > seconds) {
        _seedBehavSub.sink.add(null);
        _countDownBehavSub.sink.add(0);
        _retrieveSeedSetTimer();
        return;
      }

      final count = seconds - timer.tick;
      _countDownBehavSub.sink.add(count);
    });

    _seedBehavSub.sink.add(seedData);
  }

  dispose() {
    _seedBehavSub?.close();
    _countDownBehavSub?.close();
    _timer?.cancel();
  }
}
