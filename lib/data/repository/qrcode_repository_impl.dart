import 'package:qrtestcodeone/data/datasource/qrcode_service_datasource.dart';
import 'package:qrtestcodeone/data/model/qr_seed_datamodel.dart';
import 'package:qrtestcodeone/domain/entity/qr_seed.dart';
import 'package:qrtestcodeone/domain/repository/qrcode_repository.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///

class QrCodeRepositoryImpl extends QrCodeRepository {
  final QrCodeServiceDataSource dataSource;

  QrCodeRepositoryImpl(this.dataSource);

  @override
  Future<QrSeed> getSeed() async {
    final QrSeedDataModel response = await dataSource.getSeed();
    return response.toQrSeed();
  }
}
