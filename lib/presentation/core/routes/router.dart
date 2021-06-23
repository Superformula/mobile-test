import 'package:auto_route/auto_route.dart';
import 'package:qr_generator/presentation/home/home_page.dart';
import 'package:qr_generator/presentation/qr_code/qr_code_page.dart';
import 'package:qr_generator/presentation/scan/scan_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: HomePage, initial: true),
  MaterialRoute(page: QRCodePage, path: '/qr-code'),
  MaterialRoute(page: ScanPage, path: 'scan'),
], replaceInRouteName: 'Page,Route')
class $AppRouter {}
