//Flutter Packages
import 'package:flutter/material.dart';
import 'package:superformula_scanner/screens/qr_code_screen.dart';
import 'package:superformula_scanner/screens/scanner_screen.dart';

//My Packages
import '../widgets/action_button.dart';
import '../widgets/expandable_fab.dart';

//Third party packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = "/home_screen";
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
        distance: ScreenUtil().setHeight(90),
        children: [
          ActionButton(
            onPressed: () => Navigator.of(context).pushNamed(QRCCodeScreen.routeName),
            icon: const Icon(Icons.qr_code),
          ),
          ActionButton(
            onPressed: () => Navigator.of(context).pushNamed(ScannerScreen.routeName),
            icon: const Icon(Icons.camera_alt),
          ),
        ],
      ),

    );
  }
}
