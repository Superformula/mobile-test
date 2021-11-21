import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:superformula_qr_code/shared/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Home'),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.qr_code,
            ),
            label: 'QR Code',
            onTap: () async {
              Navigator.of(context).pushNamed(AppRoutes.qrCodeScreen);
            },
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.camera,
            ),
            label: 'Scan',
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.scanScreen);
            },
          ),
        ],
      ),
    );
  }
}
