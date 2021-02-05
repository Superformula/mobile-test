import 'dart:math';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:qrGenerator/app/navigation/routes.dart';
import 'package:qrGenerator/app/resources/qr_styles.dart';
import 'package:qrGenerator/app/utils/screen_utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FabCircularMenuState> _fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            title: Text('Home', style: TextStyle(color: Colors.black45))),

        // Custom FAB that shows menu options: Scan and QRCode.
        // Tapping on a menu selection will navigate to the selected page.
        floatingActionButton: FabCircularMenu(
          key: _fabKey,
          fabColor: Colors.red[500],
          fabOpenIcon: const Icon(Icons.menu, color: Colors.white),
          fabCloseIcon: const Icon(Icons.close, color: Colors.white),
          ringDiameter: min(ScreenUtils.width(context), ScreenUtils.height(context)) * 0.75,
          children: [
            InkWell(
                onTap: () => _navigateToPage(context, Routes.scan),
                child: Text('Scan', style: QrStyles.fabMenuItem)
            ),
            InkWell(
                onTap: () => _navigateToPage(context, Routes.qrCode),
                child: Text('QrCode', style: QrStyles.fabMenuItem)
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
          child: Text('Tap on the FAB to get started.', style: QrStyles.homePrompt)
        )
    );
  }

  _navigateToPage(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
    _fabKey.currentState.close();
  }
}
