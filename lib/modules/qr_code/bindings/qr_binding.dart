import 'package:get/get.dart';
import 'package:superformula_test/core/data/repositories/qr_code_repo/qr_repo.dart';
import 'package:superformula_test/core/data/repositories/qr_code_repo/qr_repo_interface.dart';
import 'package:superformula_test/core/services/http_service/http_service.dart';
import 'package:superformula_test/modules/qr_code/controllers/qr_code_controller.dart';

class QrCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HttpService>(HttpService());

    Get.put<QrRepositoryInterface>(QrRepository());

    Get.put(QrCodeController());
  }
}
