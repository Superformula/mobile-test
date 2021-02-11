import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:qr_app/models/seed_data.dart';
import 'package:qr_app/repositories/seed_repository.dart';
import 'package:qr_app/route_names.dart';
import 'package:qr_app/services/navigation_service.dart';
import 'package:qr_app/services/services.dart';
import 'package:rxdart/subjects.dart';

final getIt = GetIt.instance;
const INITIAL_CACHE_INDEX = -1;

class SeedBloc {
  final _seedBehavSub = BehaviorSubject<SeedData>();
  final _countDownBehavSub = BehaviorSubject<int>();
  Timer _timer;
  int _cacheIndex = INITIAL_CACHE_INDEX;

  NavigationService get _navigationService => getIt<NavigationService>();
  SeedRepository get _seedRepository => getIt<SeedRepository>();
  CacheService get _cacheService => getIt<CacheService>();
  LoggingService get _loggingService => getIt<LoggingService>();

  Stream<SeedData> get seedData => _seedBehavSub.stream;
  Stream<int> get countDownValue => _countDownBehavSub.stream;

  Future<void> navToQRCode() async {
    _navigationService.navigate(RouteNames.Code);
    try {
      _cacheIndex = INITIAL_CACHE_INDEX;
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

    final seedData = await retrieveSeedData();
    if (seedData == null) return;

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

  Future<SeedData> retrieveSeedData() async {
    Completer<SeedData> completer = Completer();
    _seedRepository.retrieve().then((data) {
      _cacheService.create(data);
      completer.complete(data);
    }).catchError((error) {
      _loggingService.information('HTTP failed', details: error.toString());

      _cacheService.retrieveAll().then((list) {
        final index = _nextIndex(list.length);
        final data = list[index];
        _loggingService.information('Retieved from cache');
        completer.complete(
          data.copyWith(
            dateTime: DateTime.now()
                .add(
                  Duration(seconds: 15),
                )
                .toIso8601String(),
          ),
        );
      }).catchError((error) {
        _loggingService.error(error);
        _countDownBehavSub.sink.addError(error);
        completer.complete(null);
      });
    });

    return completer.future;
  }

  int _nextIndex(maxLength) {
    final nextIndex =
        _cacheIndex < maxLength - 1 && _cacheIndex != INITIAL_CACHE_INDEX
            ? _cacheIndex += 1
            : 0;
    _cacheIndex = nextIndex;
    return _cacheIndex;
  }

  dispose() {
    _seedBehavSub?.close();
    _countDownBehavSub?.close();
    _timer?.cancel();
  }
}
