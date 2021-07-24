import 'package:qrtestcodeone/domain/entity/qr_seed.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///

abstract class QrCodeRepository {
  /// Generate a new seed that can be used to generate a QR code
  Future<QrSeed> getSeed();
}
