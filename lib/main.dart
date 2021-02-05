import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/dependency_injection/injector.dart';
import 'app/navigation/router.dart';
import 'app/navigation/routes.dart';
import 'app/pages/home_page.dart';
import 'app/resources/qr_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerDependencies();
  _configureDeviceOrientation().then((value) => runApp(QrCodeApp()));
}

/// Run on portrait mode only
Future<void> _configureDeviceOrientation() {
  return SystemChrome.setPreferredOrientations
    ([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

/// Setup dependencies
///
/// The isProduction flag is an optional compile-time switch that may be used to toggle between
/// production and testing/development environments.
void registerDependencies({bool isProduction = true}) {
  Injector.setup(isProduction);
}

/// App root
class QrCodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QRCode Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: QrColors.gray3,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.red[500],
          foregroundColor: Colors.white
        )
      ),
      initialRoute: Routes.home,
      onGenerateRoute: PageRouter.generateRoute,
      home: HomePage(),
    );
  }
}