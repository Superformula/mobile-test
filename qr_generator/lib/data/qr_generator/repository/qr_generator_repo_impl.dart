import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:qr_generator/data/api/api.dart';
import 'package:qr_generator/domain/model/failure.dart';
import 'package:qr_generator/domain/model/qr_code.dart';
import 'package:http/http.dart' as http;
import 'package:qr_generator/domain/qr_generator/repository/qr_generator_repo.dart';

class QRGeneratorRepositoryImpl implements QRGeneratorRepository {
  QRGeneratorRepositoryImpl(this.api);

  final QRApi api;

  @override
  Future<Either<Failure, QRCode>> generateQRCode() async {
    http.Response response = await api.generateQR();

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse =
          jsonDecode(response.body) as Map<String, dynamic>;
      QRCode qr = QRCode(
        jsonResponse['seed'],
        DateTime.parse(
          jsonResponse['expiresAt'],
        ),
      );
      return Right(qr);
    } else {
      return Left(Failure('QR generator API error: ${response.statusCode}'));
    }
  }
}
