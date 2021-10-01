import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superformula_mobile_test/domain/core/exceptions.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/i_qr_seed_local_data_source.dart';
import 'package:superformula_mobile_test/infrastructure/display_qr_code/qr_seed_dto.dart';
import 'package:superformula_mobile_test/locator.dart';

@Injectable(as: IQrCodeLocalDataSource)
class QrCodeLocalDataSource implements IQrCodeLocalDataSource {
  final sharedPreferences = locator<SharedPreferences>();

  @override
  Future<void> cacheQrSeed(QrSeedDto qrcodeToCache) async {
    await sharedPreferences.setString(IQrCodeLocalDataSource.cachedQrCode,
        jsonEncode(qrcodeToCache.toJson()));
  }

  /// Gets the cached [QrSeedDto] which was gotten the last time
  /// the user had an internet connection.
  /// Throws [CacheException] if no cached data is present.
  @override
  Future<QrSeedDto> getLastQrSeed() async {
    final jsonString =
        sharedPreferences.getString(IQrCodeLocalDataSource.cachedQrCode);
    if (jsonString != null) {
      return QrSeedDto.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
    } else {
      throw CacheException();
    }
  }
}
