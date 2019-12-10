import 'package:flutter/widgets.dart';
import 'package:qr_code_app/presentation_flutter/app/qr_code_app.dart';
import 'package:qr_code_app/presentation_flutter/app/root_router/home/home_page.dart';
import 'package:qr_code_app/presentation_flutter/app/root_router/root_router_page.dart';

// Could add flavor-specific definitions
Widget createApp() {
  return QrCodeApp(
    buildRootPage: (context) => RootRouterPage(
      buildHomePage: () => HomePage(),
    ),
  );
}
