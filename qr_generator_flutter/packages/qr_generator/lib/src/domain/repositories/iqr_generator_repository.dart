import 'package:dartz/dartz.dart';

import 'package:errors/errors.dart';

import '../entities/seed.dart';

/// Repository interface for `QRGeneratorRepository`
abstract class IQrGeneratorRepository {
  /// Get Random seed from a datasource
  ///
  /// return instance of `Failure` if there is an error
  ///
  /// return instance of `Seed` if successful
  Future<Either<Failure, Seed>> getSeed();
}
