import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:superformula_mobile_test/presentation/display_qr_code/display_qr_code.dart';
import 'package:superformula_mobile_test/presentation/core/home_screen.dart';
import 'package:superformula_mobile_test/presentation/scan_qr_code/scan_qr_code.dart';

@MaterialAutoRouter(
  // replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute<HomeScreen>(page: HomeScreen, initial: true, path: '/'),
    AutoRoute<DisplayQrCodeScreen>(page: DisplayQrCodeScreen),
    AutoRoute<ScanQrCodeScreen>(page: ScanQrCodeScreen),
  ],
)
class $AppRouter {}
