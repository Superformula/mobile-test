import 'package:domain_models/domain_models.dart';
import 'package:qr_code_repository/src/mappers/remote_to_remote.dart';
import 'package:qr_generator_api/qr_generator_api.dart';

/// {@template qr_code_repository}
/// A Dart Repository which manages the qr code domain.
/// {@endtemplate}
class QrCodeRepository {
  /// {@macro qr_code_repository}
  const QrCodeRepository({
    required this.remoteApi,
  });

  final QrGeneratorApi remoteApi;

  Future<QrCode> getSeed() async {
    try {
      final apiQrCode = await remoteApi.getSeed();
      final domainQrCode = apiQrCode.toDomainModel();
      return domainQrCode;
    } on SeedQrGeneratorNotFoundException catch (_) {
      throw SeedNotFoundException();
    } on SeedRequestQrGeneratorException catch (_) {
      throw SeedRequestException();
    }
  }
}
