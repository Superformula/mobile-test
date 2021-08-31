import 'package:get/get.dart';
import 'package:superformula_test/core/data/models/qr_model.dart';

abstract class QrRepositoryInterface {
  Future<QrModel> getSeed();
  Future validateQrCode(String code);
}

///This is a convenience mixin that allows us to have a cleaner controller class for easier Dependency Injection. 

mixin QrRepoMixin {
  QrRepositoryInterface get qrRepository => Get.find<QrRepositoryInterface>();
}
