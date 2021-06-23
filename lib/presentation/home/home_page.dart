import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qr_generator/presentation/custom_widgets/fab_button/expandable_fab.dart';
import 'package:qr_generator/presentation/custom_widgets/fab_button/fab_action.dart';
import 'package:qr_generator/presentation/core/routes/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      floatingActionButton: ExpandableFab(
        children: [
          FabAction(
            onPressed: () {
              AutoRouter.of(context).push(const QRCodeRoute());
            },
            icon: const Icon(Icons.qr_code),
          ),
          FabAction(
            onPressed: () {
              AutoRouter.of(context).push(const ScanRoute());
            },
            icon: const Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}
