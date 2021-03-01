import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

import '../entities/seed.dart';

/// Repository interface for qr_gen.
abstract class IQrGenRepository {
  /// Gets a [Seed] from a service.
  Future<Either<Failure, Seed>> getSeed();
}
