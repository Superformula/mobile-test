import 'package:fab_menu/fab_menu.dart';
import 'package:flutter/material.dart';
import 'package:superformula/ui_layer/qr_generating_page.dart';
import 'package:superformula/ui_layer/scaning_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text(
            'Tap the Floating Action Button to get started',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ),
      floatingActionButton: _buildFabMenu(context),
    );
  }

  Widget _buildFabMenu(BuildContext context) {
    final theme = Theme.of(context);

    return FabMenu(
      labelTextColor: theme.textTheme.body1.color,
      mainButtonBackgroundColor:
          theme.floatingActionButtonTheme.backgroundColor,
      maskColor: Colors.black,
      menuButtonBackgroundColor: Colors.purpleAccent,
      menuButtonColor: Colors.white,
      menus: [
        _buildMenuItem(
          icon: Icons.camera,
          label: 'Scan',
          route: ScanningPage.route,
        ),
        _buildMenuItem(
          icon: Icons.cloud,
          label: 'QR Code',
          route: QrGeneratingPage.route,
        )
      ],
    );
  }

  MenuData _buildMenuItem({IconData icon, String route, String label}) {
    return MenuData(
      icon,
      (context, menuData) {
        Navigator.of(context).pushNamed(route);
      },
      labelText: label,
    );
  }
}
