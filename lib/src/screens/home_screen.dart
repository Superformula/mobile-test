import 'package:flutter/material.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';
import 'package:mobile_test/src/screens/base_screen.dart';
import 'package:mobile_test/src/screens/qr_code_generator.dart';
import 'package:mobile_test/src/screens/qr_scanner.dart';
import 'package:mobile_test/src/utilities/navigator_util.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void pushNextScreen(Widget nextScreen) {
    NavigatorUtil().push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
          settings: RouteSettings(name: nextScreen.runtimeType.toString()),
          builder: (BuildContext context) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<FabMiniMenuItem> miniMenuItemList = <FabMiniMenuItem>[
      FabMiniMenuItem.withText(
          const Icon(
            Icons.qr_code_scanner,
          ),
          Colors.blue,
          4.0,
          'Button menu',
          () => pushNextScreen(QRCodeScannerScreen()),
          'Scan',
          Colors.blue,
          Colors.white,
          true),
      FabMiniMenuItem.withText(
          const Icon(
            Icons.qr_code,
          ),
          Colors.blue,
          4.0,
          'Button menu',
          () => pushNextScreen(const GenerateQRCodeScreen()),
          'QRCode',
          Colors.blue,
          Colors.white,
          true),
    ];

    return BaseScreenScaffold(
      title: 'HOME',
      floatingButton: FabDialer(
        miniMenuItemList,
        Colors.blue,
        const Icon(
          Icons.add,
          key: Key('fab-dailer'),
        ),
      ),
    );
  }
}
