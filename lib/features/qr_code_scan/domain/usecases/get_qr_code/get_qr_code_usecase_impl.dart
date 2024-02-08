import 'package:dartz/dartz.dart';
import 'package:superformula_leandro/core/errors/failures/failure.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/entities/qr_code_entity.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/repositories/get_qr_code_repository.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/usecases/get_qr_code/get_qr_code_usecase.dart';

final class GetQrCodeUsecaseImpl implements GetQrCodeUsecase {
  const GetQrCodeUsecaseImpl({required GetQrCodeRepository getQrCodeRepository})
      : _getQrCodeRepository = getQrCodeRepository;
  final GetQrCodeRepository _getQrCodeRepository;
  @override
  Future<Either<Failure, QrCodeEntity>> call() => _getQrCodeRepository();
}
