import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:meta/meta.dart';

import '../domain.dart';

/// Get Seed Use Case
class GetSeed {
  ///Get seed Use Case
  GetSeed({@required this.repository}) : assert(repository != null);

  /// Repository instance
  final IQrGeneratorRepository repository;

  /// Callable class method
  Future<Either<Failure, Seed>> call() async {
    return await repository.getSeed();
  }
}
