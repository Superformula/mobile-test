import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qr_generator_app/app/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Generator App"),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.qr_code),
            onTap: () => Navigator.of(context).pushNamed(AppRoutes.displayQr),
          ),
          SpeedDialChild(
            child: const Icon(Icons.camera_alt_outlined),
            onTap: () => Navigator.of(context).pushNamed(AppRoutes.scanQr),
          )
        ],
      ),
    );
  }
}
