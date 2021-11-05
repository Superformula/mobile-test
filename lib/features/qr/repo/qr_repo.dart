import 'package:sf_qr_code/features/qr/models/seed_response.dart';
import 'package:sf_qr_code/features/qr/repo/qr_data_provider.dart';

class QrRepository {
  final QrDataProvider _qrDataProvider;
  QrRepository({QrDataProvider? qrDataProvider})
      : _qrDataProvider = qrDataProvider ?? QrDataProvider();

  Future<SeedResponse> fetchQRSeedData() {
    return _qrDataProvider.fetchQRSeedData();
  }
}
