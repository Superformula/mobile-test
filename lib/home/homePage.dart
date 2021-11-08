import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:generator/widgets/appbar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, label: widget.title),
      body: SafeArea(child: bodyData()),
      floatingActionButton: floatingButton(),
    );
  }

  Widget bodyData() => Center(
        child: Container(
          child: Icon(Icons.account_circle_sharp,
              size: MediaQuery.of(context).size.width * .50,
              color: Theme.of(context).primaryColor),
        ),
      );

  Widget floatingButton() => SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: Icon(Icons.qr_code),
              backgroundColor: Theme.of(context).primaryColor,
              label: 'QR CODE',
              onTap: () => Navigator.pushNamed(context, '/GeneratePage')),
          SpeedDialChild(
              child: Icon(Icons.qr_code_scanner_outlined),
              backgroundColor: Theme.of(context).primaryColor,
              label: 'SCAN',
              onTap: () => Navigator.pushNamed(context, '/ScanPage'))
        ],
      ); // This trailing c
}
