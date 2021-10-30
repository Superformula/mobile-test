import 'package:flutter/material.dart';
import 'package:superformula_scanner/widgets/action_button.dart';
import 'package:superformula_scanner/widgets/expandable_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            onPressed: () => (){},
            icon: const Icon(Icons.qr_code),
          ),
          ActionButton(
            onPressed: () => (){},
            icon: const Icon(Icons.camera_alt),
          ),
        ],
      ),

    );
  }
}
