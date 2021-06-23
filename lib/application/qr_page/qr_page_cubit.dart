import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_generator/domain/failures/common_failure.dart';
import 'package:qr_generator/domain/i_seed_generator_repository.dart';
import 'package:qr_generator/domain/seed.dart';

part 'qr_page_state.dart';
part 'qr_page_cubit.freezed.dart';

@injectable
class QrPageCubit extends Cubit<QrPageState> {
  final ISeedGeneratorRepository _generatorRepository;

  QrPageCubit(this._generatorRepository) : super(const QrPageState.loading());

  Future<void> loadQr() async {
    final seedOrFailure = await _generatorRepository.fetchSeed();
    // map response to state
    emit(
      seedOrFailure.fold(
        (l) => QrPageState.loadError(failure: l),
        (r) {
          final now = DateTime.now();
          // check if token hasn't expired (true if it comes from cache and device is offline)
          if (r.expiresAt.compareTo(now).isNegative) {
            return const QrPageState.loadError(
              failure: CommonFailure.noInternet(),
            );
          }
          // success start timer for ttl (Time to live) 
          _startTimer();
          return QrPageState.loaded(
              seed: r, ttl: _calculateTTL(expiresAt: r.expiresAt, now: now));
        },
      ),
    );
  }

  Timer? timer;
  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state.maybeMap(
        orElse: () => timer.cancel(),
        loaded: (loadedState) {
          if (loadedState.ttl == 0) {
            // cancel timer and refresh seed
            timer.cancel();
            emit(const QrPageState.loading());
            loadQr();
          } else {
            // decrement ttl
            emit(loadedState.copyWith(ttl: loadedState.ttl - 1));
          }
        },
      );
    });
  }

  // get time difference in seconds between two dates
  int _calculateTTL({required DateTime expiresAt, required DateTime now}) =>
      (expiresAt.millisecondsSinceEpoch - now.millisecondsSinceEpoch) ~/ 1000;

  @override
  Future<void> close() {
    //release timer
    timer?.cancel();
    return super.close();
  }
}
