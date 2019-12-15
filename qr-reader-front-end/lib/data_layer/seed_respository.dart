import 'package:superformula/data_layer/qr_seed.dart';

abstract class SeedRepository {
  Future<QrSeed> fetchLatestSeed();
}
