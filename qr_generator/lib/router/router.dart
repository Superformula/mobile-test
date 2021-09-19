import 'package:auto_route/auto_route.dart';
import 'package:qr_generator/presentation/home/home_screen.dart';
import 'package:qr_generator/presentation/qr_generator/generator_screen.dart';
import 'package:qr_generator/presentation/qr_scanner/scanner_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(page: QRScannerScreen),
    AutoRoute(page: QRGeneratorScreen),
  ],
)
class $AppRouter {}
