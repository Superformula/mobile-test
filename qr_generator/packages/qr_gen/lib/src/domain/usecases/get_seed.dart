import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:meta/meta.dart';

import '../entities/seed.dart';
import '../repositories/iqr_gen_repository.dart';

///
/// * [GetSeed] use case
///
class GetSeed {
  /// Gets a [Seed] from a data repository.
  GetSeed({
    @required IQrGenRepository repository,
  })  : assert(repository != null),
        _repository = repository;

  final IQrGenRepository _repository;

  /// Callable class method
  Future<Either<Failure, Seed>> call() async => await _repository.getSeed();
}
