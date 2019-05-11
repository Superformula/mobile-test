import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:supercode/widgets/empty_state.dart';
import 'package:supercode/widgets/supercode_app_bar.dart';

class Home extends StatelessWidget {
  final Function() navigateToQrCode;
  final Function() navigateToScan;

  Home({
    Key key,
    this.navigateToQrCode,
    this.navigateToScan,
  }) : super(key: key);

  TextStyle _labelStyle(BuildContext context) {
    return TextStyle(color: Colors.white);
  }

  Widget _buildEmptyState() {
    return EmptyState(
      icon: Icon(
        Icons.pan_tool,
        size: 48,
      ),
      title: 'Welcome!',
      description: 'Tap the menu icon to scan or generate a QR Code',
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SupercodeAppBarTitle(),
      ),
      body: _buildEmptyState(),
      floatingActionButton: SpeedDial(
        overlayColor: Theme.of(context).primaryColor,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.code),
            label: 'Generate Code',
            labelStyle: _labelStyle(context),
            labelBackgroundColor: Theme.of(context).primaryColor,
            onTap: navigateToQrCode,
          ),
          SpeedDialChild(
            child: Icon(Icons.camera_alt),
            label: 'Scan Code',
            labelStyle: _labelStyle(context),
            labelBackgroundColor: Theme.of(context).primaryColor,
            onTap: navigateToScan,
          ),
        ],
      ),
    );
  }
}
