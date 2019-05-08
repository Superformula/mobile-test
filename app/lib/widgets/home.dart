import 'package:flutter/material.dart';
import 'package:supercode/empty_state.dart';
import 'package:supercode/widgets/supercode_app_bar.dart';

class Home extends StatelessWidget {
  final Function() navigateToQrCode;

  const Home({
    Key key,
    this.navigateToQrCode,
  }) : super(key: key);

  Widget _buildEmptyState() {
    return EmptyState(
      icon: Icons.announcement,
      title: 'Welcome!',
      description: 'Tap the + to scan or generate a QR Code',
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SupercodeAppBarTitle(),
      ),
      body: _buildEmptyState(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Generate QR Code',
        onPressed: navigateToQrCode,
      ),
    );
  }
}
