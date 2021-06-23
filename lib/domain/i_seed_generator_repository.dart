
import 'package:dartz/dartz.dart';
import 'package:qr_generator/domain/failures/common_failure.dart';
import 'package:qr_generator/domain/seed.dart';

abstract class ISeedGeneratorRepository {
  Future<Either<CommonFailure, Seed>> fetchSeed();
}