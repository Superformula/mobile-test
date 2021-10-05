import 'package:rxdart/subjects.dart';
import '../../interactors/seed_interactor.dart';
import '../../models/seed.dart';

class GenerateSeedPageBloc {
  GenerateSeedPageBloc({
    required SeedInteractor seedInteractor,
  }) : _seedInteractor = seedInteractor;

  final SeedInteractor _seedInteractor;
  final BehaviorSubject<Seed?> _seedSubject = BehaviorSubject<Seed?>();

  Stream<Seed?> observeSeed() => _seedSubject;

  Future<void> refreshSeed() {
    _seedSubject.add(null);
    return _seedInteractor
        .fetchSeed()
        .then(_seedSubject.add)
        .catchError(_seedSubject.addError);
  }
}
