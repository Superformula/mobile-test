import 'package:flutter/material.dart';
import 'package:super_qr/ui/components/speed_dial.dart';
import 'package:super_qr/utils/constants.dart';
import 'package:super_qr/utils/qr_info.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          HOME_PAGE_TITLE,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Main content
            buildMainContent(),
          ],
        ),
      ),
      floatingActionButton: HomeSpeedDial(),
    );
  }

  Expanded buildMainContent() {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(QR_CODE_INFO)),
            ],
          ),
        ],
      ),
    );
  }
}
