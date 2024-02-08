import 'package:dartz/dartz.dart';
import 'package:superformula_leandro/core/errors/failures/failure.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/entities/qr_code_entity.dart';

abstract interface class GetQrCodeUsecase {
  Future<Either<Failure, QrCodeEntity>> call();
}
