import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:superformula_mobile_test/presentation/app_router.gr.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('home screen'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'ScanButtonHero',
            onPressed: () => context.router.push(const ScanQrCodeScreenRoute()),
            tooltip: 'Scann Qr Code',
            child: const Icon(Icons.camera_alt),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'DisplayButtonHero',
            onPressed: () =>
                context.router.push(const DisplayQrCodeScreenRoute()),
            tooltip: 'Display Qr Code',
            child: const Icon(Icons.qr_code_2_rounded),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'HomeButtonHero',
            onPressed: () {},
            tooltip: 'Unused button',
            child: const Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
