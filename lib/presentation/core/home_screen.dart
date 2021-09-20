import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:superformula_mobile_test/presentation/app_router.gr.dart';
import 'package:superformula_mobile_test/presentation/core/misc/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: superformulaBackgroundColor,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/superformula-logo.svg',
              semanticsLabel: 'Superformula Logo',
              width: 100,
            ),
            const SizedBox(
              height: 16,
            ),
            SvgPicture.asset(
              'assets/superformula-text.svg',
              semanticsLabel: 'Superformula',
              width: 150,
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            onPressed: () => context.router.push(const ScanQrCodeScreenRoute()),
            label: 'Scan Qr Code',
            backgroundColor: superformulaSecondaryColor,
            foregroundColor: superformulaBackgroundColor,
            child: const Icon(Icons.camera_alt),
          ),
          SpeedDialChild(
            onPressed: () =>
                context.router.push(const DisplayQrCodeScreenRoute()),
            label: 'Display Qr Code',
            backgroundColor: superformulaSecondaryColor,
            foregroundColor: superformulaBackgroundColor,
            child: const Icon(Icons.qr_code_2_rounded),
          ),
        ],
        openBackgroundColor: superformulaSecondaryColor,
        openForegroundColor: superformulaBackgroundColor,
        closedForegroundColor: superformulaBackgroundColor,
        closedBackgroundColor: superformulaSecondaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
