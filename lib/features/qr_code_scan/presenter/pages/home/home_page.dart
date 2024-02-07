import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:superformula_leandro/core/constants/strings_constants.dart';
import 'package:superformula_leandro/core/routes/named_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsConstants.home),
        centerTitle: true,
      ),
      floatingActionButton: SpeedDial(
        children: [
          SpeedDialChild(
            child: const Icon(Icons.camera_alt_outlined),
            onTap: () {
              Navigator.pushNamed(context, NamedRoutes.scan);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.qr_code_scanner_rounded),
            onTap: () {
              Navigator.pushNamed(context, NamedRoutes.qrCode);
            },
          ),
        ],
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
