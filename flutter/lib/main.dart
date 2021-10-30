import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:superformula_scanner/providers/superformula_provider.dart';
import 'package:superformula_scanner/screens/home_screen.dart';
import 'package:superformula_scanner/screens/offline_screen.dart';
import 'package:superformula_scanner/screens/qr_code_screen.dart';
import 'package:superformula_scanner/screens/scanner_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: ()=> MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: SuperFormulaProvider()),
        ],
        child: MaterialApp(
          title: 'Superformula Scanner',
          routes: {
            HomeScreen.routeName: (ctx) => const HomeScreen(),
            QRCCodeScreen.routeName: (ctx) => const QRCCodeScreen(),
            ScannerScreen.routeName: (ctx) => const ScannerScreen(),
            OfflineScreen.routeName: (ctx) => const OfflineScreen(),
          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
          builder: EasyLoading.init(),
        ),
      )
    );
  }
}