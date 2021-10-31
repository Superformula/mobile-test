//Flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//Third party packages
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
//My packages
import '../providers/superformula_provider.dart';
import '../screens/home_screen.dart';
import '../screens/offline_screen.dart';
import '../screens/qr_code_screen.dart';
import '../screens/scanner_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Portrait Orientation Lock
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: ()=> MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: SuperFormulaProvider()),
        ],
        child: MaterialApp(
          title: 'Scanner',
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