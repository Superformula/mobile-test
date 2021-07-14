import 'package:flutter/material.dart';
import 'package:matheus_massula_test/models/home_menu_options.dart';
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
      onSelected: (HomeMenuOptions selectedOption) async {

      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<HomeMenuOptions>>[
        PopupMenuItem<HomeMenuOptions>(
          value: HomeMenuOptions.scan,
          child: Row(
            children: [
              const Text(StringConstant.SCAN_LABEL),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: const Icon(Icons.qr_code_scanner_rounded),
              ),
            ],
          )
        ),
        PopupMenuItem<HomeMenuOptions>(
          value: HomeMenuOptions.qr_code,
          child: Row(
            children: [
              const Text(StringConstant.QR_CODE_LABEL),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: const Icon(Icons.qr_code_2_rounded),
              ),
            ],
          )
        )
      ],
    ),
  );
}