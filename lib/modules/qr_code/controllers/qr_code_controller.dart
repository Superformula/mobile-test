import 'package:get/get.dart';
import 'package:superformula_test/core/data/models/qr_model.dart';
import 'package:superformula_test/core/data/repositories/qr_code_repo/qr_repo_interface.dart';

class QrCodeController extends GetxController
    with StateMixin<QrModel>, QrRepoMixin {
  @override
  onInit() async {
    final model = await qrRepository.getSeed();
    rebuildOnChange(model);
    super.onInit();
  }

  Future<void> rebuildOnChange(QrModel data) async {
    //change uses conditional rebuild under the hood. should not rebuild unless data is different

    change(data, status: getStatus(data));
  }

  /// If the items is empty, return empty status so the view renders onEmtpy() widget
  RxStatus getStatus(QrModel? item) {
    var status = RxStatus.success();
    if (item == null) {
      status = RxStatus.empty();
    }
    return status;
  }
}
