import 'dart:math';

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

  /// Provide a [QrCode].
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

  /// Provides a [Stream] of ticks.
  ///
  /// Given a [DateTime] it will calculate the ticks remaining.
  Stream<int> seedCountDown({
    required DateTime expireDate,
  }) {
    final dateNow = DateTime.now();
    final diffDate = expireDate.difference(dateNow);
    final ticks = diffDate.inSeconds;

    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }

  /// Validate a [String] from QRCode.
  Future<bool> validateQrCode() async {
    // Simulate random returns from the server
    await Future<void>.delayed(const Duration(seconds: 1));
    return Random().nextBool();
  }
}
