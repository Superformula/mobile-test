import 'package:dartz/dartz.dart';
import 'package:qr_generator/domain/model/failure.dart';
import 'package:qr_generator/domain/model/qr_code.dart';

abstract class QRGeneratorRepository {
  Future<Either<Failure, QRCode>> generateQRCode();
}
