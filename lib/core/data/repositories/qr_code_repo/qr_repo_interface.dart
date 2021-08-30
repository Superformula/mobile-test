import 'package:get/get.dart';

abstract class QrRepositoryInterface {
  Future<String> getSeed();
  Future validateQrCode();
}

///This is a convenience mixin that allows us to have a cleaner controller class for easier Dependency Injection. 

mixin QrRepoMixin {
  QrRepositoryInterface get qrRepository => Get.find<QrRepositoryInterface>();
}
