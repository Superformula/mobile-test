import 'package:flutter/material.dart';
import 'package:qr_test/controller/services/connectivity.dart';
import 'package:qr_test/view/components/button_child.dart';
import 'package:qr_test/view/components/fab_popout_button.dart';
import 'package:qr_test/view/qr_code_view.dart';
import 'package:qr_test/view/scan_view.dart';

import 'package:simple_speed_dial/simple_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<SpeedDialChild> buttonChildren = [
      ButtonChild(
          text: 'Scan',
          icon: const Icon(Icons.camera_alt),
          pressed: () {
            Navigator.push(
              context,
              (MaterialPageRoute(
                builder: (context) => const ScanView(),
              )),
            );
          }),
      ButtonChild(
          text: "QR Code",
          icon: const Icon(Icons.qr_code),
          pressed: () async {
            bool isConnected = await connected();
            Navigator.push(
                context,
                (MaterialPageRoute(
                  builder: (context) => QRCodeView(isConnected: isConnected),
                )));
          })
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),

      //Create and configures pop up floating action button with children buttonChildren
      floatingActionButton:
          PopOutFloatingActionButton(buttonChildren: buttonChildren),
      body: const Center(child: Text("Choose an option using the FAB")),
    );
  }
}
