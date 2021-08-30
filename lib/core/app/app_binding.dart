import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:superformula_test/core/app/app_controller.dart';
import 'package:superformula_test/core/services/shared_pref/shared_pref_service.dart';

///Initialize app services.
///you use this class as the 'initialBinding property of GetMaterialApp,
class AppBinding extends Bindings {
  @override
  void dependencies() async {
    print('init dependencies');

    ///this is where you can init services not available on web.
    ///I prefer building with web in mind, just in case we want to support it in the future, it's good to plan for
    if (!kIsWeb) {}

    ///typically you'll put the interface type into Get so the rest of our code doesn't care about the exact implementation.
    ///this mostly only makes sense with data fetching based services/repositories that can benifit from agnostic implementations
    ///that return Dart specific types like Streams or lists
    ///example: Get.lazyPut<AuthInterface>(() => FirebaseAuthService()); but also could accept MockAuthService()

    Get.lazyPut<SharedPrefService>(() => SharedPrefService());

    ///*more examples with firebase
    // Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthService());
    // Get.lazyPut<FirestoreService>(() => FirestoreService());
    // Get.lazyPut<FirebaseMessagingService>(() => FirebaseMessagingService());

    Get.put(AppController());
  }

  /// initialize packages that need to happen in main.
  /// call this in main.dart before runApp
  static Future<void> initServices({bool isTest = false}) async {
    // ex:  await Firebase.initializeApp();
  }
}
