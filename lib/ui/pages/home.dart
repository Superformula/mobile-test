import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mobile_test/ui/components/standard_page.dart';

import 'package:mobile_test/ui/pages/barcode.dart';
import 'package:mobile_test/ui/pages/scanner.dart';

/// The Home class represents the Home landing page. This page contains only a
/// StandardPage Widget with no content and a Floating Action Button that the
/// user uses to navigate to the Scan and QR Code pages.
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardPage(
      title: 'Home',
      body: Container(),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.circle),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'QR Code',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const Barcode(),
                ),
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.circle),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'Scan',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const Scanner(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
