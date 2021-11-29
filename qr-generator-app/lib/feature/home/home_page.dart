import 'package:flutter/material.dart';
import 'package:qr_generator_app/app/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Generator App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("home"),
            ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pushNamed(AppRoutes.displayQr),
                icon: const Icon(Icons.qr_code),
                label: const Text("display qr"),),
            ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pushNamed(AppRoutes.scanQr),
                icon: const Icon(Icons.qr_code),
                label: const Text("scan qr"),)

          ],
        ),
      ),
    );
  }
}
