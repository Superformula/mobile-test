import 'package:flutter/material.dart';
import 'package:qr_code_test/routes/home_page/home_body.dart';

/// The home page of the app which shows 2 buttons at the center of the screen.
/// The buttons are located in the [HomeBody] widget.
class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        centerTitle: true,
      ),
      body: const Center(
        child: HomeBody(),
      ),
    );
  }
}