import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:matheus_massula_test/models/home_menu_options.dart';
import 'package:matheus_massula_test/pages/qr_code.dart';
import 'package:matheus_massula_test/resources/string_constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.HOME_PAGE_TITLE.toUpperCase()),
        centerTitle: true,
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Container _buildFloatingActionButton(BuildContext context) => Container(
    height: 50.0,
    decoration: BoxDecoration(
      color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
      shape: BoxShape.circle
    ),
    child: PopupMenuButton<HomeMenuOptions>(
      icon: Icon(Icons.add_outlined),
      onSelected: (HomeMenuOptions selectedOption) async => _handleOptionSelection(selectedOption, context),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<HomeMenuOptions>>[
        PopupMenuItem<HomeMenuOptions>(
          value: HomeMenuOptions.scan,
          child: _buildMenuItem(
            text: StringConstant.SCAN_LABEL,
            iconData: Icons.qr_code_scanner_rounded
          )
        ),
        PopupMenuItem<HomeMenuOptions>(
          value: HomeMenuOptions.qr_code,
          child: _buildMenuItem(
            text: StringConstant.QR_CODE_LABEL,
            iconData: Icons.qr_code_2_rounded
          )
        )
      ],
    ),
  );

  Row _buildMenuItem({required String text, required IconData iconData}) => Row(
    children: [
      Text(text),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(iconData),
      ),
    ],
  );

  void _handleOptionSelection(HomeMenuOptions selectedOption, BuildContext context) {
    switch (selectedOption) {
      case HomeMenuOptions.scan:
        _scanQRCode(context);
        break;
      case HomeMenuOptions.qr_code:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRCodeContainer()));
        break;
    }
  }

  Future<void> _scanQRCode(BuildContext context) async {
    String result = await FlutterBarcodeScanner.scanBarcode(
      '#f44336',
      StringConstant.GENERIC_CANCEL,
      true,
      ScanMode.QR
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('QR Code data: $result'))
    );
  }
}