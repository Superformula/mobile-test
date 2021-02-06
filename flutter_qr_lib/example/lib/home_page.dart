import 'package:flutter/material.dart';
import 'package:flutter_qr_lib/qr_view.dart';
import 'package:flutter_qr_lib/qr_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _seed = 'Enter Seed';
  QRController _controller;

  void _onGenQR() {
    if (_seed.isEmpty) {
      return;
    }
    _controller.loadSeed(_seed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Container(
                  height: 300,
                  width: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1.0, color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 1),
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                  child: QRView(
                    onControllerCreated: (QRController controller) {
                      _controller = controller;
                    },
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Seed value',
              ),
              onChanged: (value) {
                _seed = value;
              },
            ),
            TextButton(
              onPressed: _onGenQR,
              child: Text(
                'Generate QR',
              ),
            )
          ],
        ),
      ),
    );
  }
}
