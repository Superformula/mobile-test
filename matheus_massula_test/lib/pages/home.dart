import 'package:flutter/material.dart';
import 'package:matheus_massula_test/models/home_menu_options.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
      ),
      floatingActionButton: Container(
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
                  Text('Scan'),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.qr_code_scanner_rounded),
                  ),
                ],
              )
            ),
            PopupMenuItem<HomeMenuOptions>(
              value: HomeMenuOptions.qr_code,
              child: Row(
                children: [
                  Text('QR Code'),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.qr_code_2_rounded),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}