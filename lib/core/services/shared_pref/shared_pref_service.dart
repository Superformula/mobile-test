import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  Future cacheSeed() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
  }

  Future<String> getSeed() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return 'TODO';
  }
}

mixin SharedPrefServiceMixin {
  SharedPrefService? get sharedPrefService => Get.find<SharedPrefService>();
}
