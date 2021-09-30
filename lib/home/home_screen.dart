import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test/detail/view/qr_detail_screen.dart';
import 'package:mobile_test/scan/views/scan_qr_screen.dart';
import 'package:mobile_test/widgets/expandable_fab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: ExpandableFab(
        items: [
          ExpandableItem(
            icon: Icons.qr_code_2,
            message: 'Show QR code',
            onPressed: () => Navigator.push<dynamic>(
              context,
              CupertinoPageRoute<dynamic>(
                  builder: (_) => QrDetailScreen.init()),
            ),
          ),
          ExpandableItem(
            icon: Icons.qr_code_scanner,
            message: 'Scan QR code',
            onPressed: () => Navigator.push<dynamic>(
              context,
              CupertinoPageRoute<dynamic>(builder: (_) => ScanQrScreen.init()),
            ),
          )
        ],
      ),
    );
  }
}
