import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mobile_test/screens/qr_code_screen.dart';
import 'package:mobile_test/screens/scan_screen.dart';
import 'package:mobile_test/services/gen_code.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // ignore: prefer_typing_uninitialized_variables
  var _getData;

  final bool _dialVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.deepPurple[300],
      ),

      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        animatedIconTheme: const IconThemeData(size: 22.0),
        visible: _dialVisible,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.deepPurple[300],
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: const CircleBorder(),
        // Two explanded buttols in FAB
        children: [
          // On Tap, it will make an API call and return generated seed and pass it through the navigation constructor
          SpeedDialChild(
            child: const Icon(Icons.qr_code),
            backgroundColor: Colors.white,
            label: 'QrCode',
            onTap: () async {
              GenCode getCode = GenCode();
              _getData = await getCode.fetchCode();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QrCodeScreen(data: _getData.seed, deviceId: _getData.deviceId, time: _getData.time),
                ),
              );
            },
          ),
          // On Tap, it will make an API call and pass if generated 
          //seed is available through the navigation constructor
          SpeedDialChild(
            child: const Icon(Icons.photo_camera_outlined),
            backgroundColor: Colors.white,
            label: 'Scan',
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScanScreen(
                    data: _getData,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text('QrCode')),
    );
  }
}
