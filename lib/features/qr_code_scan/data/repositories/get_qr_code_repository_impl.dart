import 'package:dartz/dartz.dart';
import 'package:superformula_leandro/core/errors/exceptions/qr_code_exception.dart';
import 'package:superformula_leandro/core/errors/failures/failure.dart';
import 'package:superformula_leandro/core/errors/failures/qr_code_failure.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/datasources/get_qr_code/get_qr_code_datasource.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/entities/qr_code_entity.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/repositories/get_qr_code_repository.dart';

final class GetQrCodeRepositoryImpl implements GetQrCodeRepository {
  const GetQrCodeRepositoryImpl(
      {required GetQrCodeDatasource getQrCodeDatasource})
      : _getQrCodeDatasource = getQrCodeDatasource;

  final GetQrCodeDatasource _getQrCodeDatasource;
  @override
  Future<Either<Failure, QrCodeEntity>> call() async {
    try {
      final result = await _getQrCodeDatasource();
      return Right(result);
    } on QrCodeException catch (exception) {
      return Left(QrCodeFailure(message: exception.message));
    }
  }
}
