import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superformula_scanner/screens/home_screen.dart';
import 'package:superformula_scanner/screens/qr_code_screen.dart';
import 'package:superformula_scanner/widgets/action_button.dart';
import 'package:superformula_scanner/widgets/expandable_fab.dart';

class ScannerScreen extends StatefulWidget {

  static const routeName = "/scanner_screen";
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner"),
      ),
    );
  }
}
