import 'dart:convert';

import 'package:rxdart/subjects.dart';

import '../../interactors/seed_interactor.dart';
import '../../models/seed.dart';
import '../../routes/disposable.dart';

class ScanSeedPageBloc implements Disposable {
  ScanSeedPageBloc({
    required SeedInteractor seedInteractor,
  }) : _seedInteractor = seedInteractor;

  final SeedInteractor _seedInteractor;
  final BehaviorSubject<bool> _seedValidationSubject = BehaviorSubject<bool>();

  Stream<bool> observeSeedValidation() => _seedValidationSubject;

  void validateSeed(String data) {
    try {
      final Seed seed = Seed.fromJson(
        json.decode(data) as Map<String, dynamic>,
      );
      _seedValidationSubject.add(_seedInteractor.isValid(seed));
    } catch (_) {
      _seedValidationSubject.add(false);
    }
  }

  @override
  void dispose() {
    _seedValidationSubject.close();
  }
}
