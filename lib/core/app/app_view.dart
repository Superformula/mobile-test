import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superformula_test/core/app/app_binding.dart';
import 'package:superformula_test/core/app/app_controller.dart';
import 'package:superformula_test/core/app/routes/routes.dart';

class MyApp extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    ///device preview allows us to easily see different screen sizes to check responsiveness
    return DevicePreview(
      enabled: kReleaseMode //ensure it doesnt get enabled in release mode
          ? false
          : true,
      builder: (c) => GetMaterialApp(
        // showPerformanceOverlay: true,
        // debugShowMaterialGrid: true,
        title: 'Qr Code',
        getPages: Routes.pages,
        initialRoute: Routes.Home,
        initialBinding: AppBinding(),
        debugShowCheckedModeBanner: false,
        unknownRoute: Routes.unknownRoute,
        navigatorKey: Get.key,
        builder: (co, s) => Column(
          children: [
            Expanded(child: DevicePreview.appBuilder(co, s)),
            //if you were using admob, you could put that widget here, below your app
          ],
        ),
      ),
    );
  }
}
