import 'package:flutter/material.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Center(
        child: Text(
          'Tap the fab to get started!',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButton: SpeedDial(
        child: const Icon(Icons.add),
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            child: const Icon(Icons.camera),
            label: 'Scan',
            onPressed: () => Navigator.pushNamed(context, '/qrscanner'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.qr_code),
            label: 'Create QR Code',
            onPressed: () => Navigator.pushNamed(context, '/qrgen'),
          ),
        ],
      ),
    );
  }
}
