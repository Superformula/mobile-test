import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.camera),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            label: 'Scan',
            onTap: () => Navigator.pushNamed(context, '/scan_view'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.qr_code),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            label: 'QR Code',
            onTap: () => Navigator.pushNamed(context, '/qr_view'),
          ),
        ],
      ),
    );
  }
}
