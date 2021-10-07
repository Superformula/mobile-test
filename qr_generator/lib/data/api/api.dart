import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:qr_generator/domain/model/failure.dart';

abstract class QrApi {
  Future<Either<Failure, http.Response>> generateQR();
}

class QRApiImpl implements QrApi {
  final String _baseUrl = '8mpaf1q1g5.execute-api.us-west-1.amazonaws.com';
  final String _urlPath = '/default/random-qr-seed_seed';
  final Map<String, String> _headers = {
    // This value isn't hidden to ease testing of the SF exercise
    "x-api-key": "VVTUTAdalB55yRKQzsM7u6RTowrcUUhJLA82hoN6"
  };

  @override
  Future<Either<Failure, http.Response>> generateQR() async {
    Uri url = Uri.https(_baseUrl, _urlPath);
    Map<String, String> headers = _headers;

    try {
      return Right(
        await http.get(
          url,
          headers: headers,
        ),
      );
    } catch (e) {
      return Left(Failure('Something went wrong. Try again later.'));
    }
  }
}
