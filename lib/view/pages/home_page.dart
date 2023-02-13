import 'dart:async';
import 'package:flutter/material.dart';
import 'package:superformula_test/core/resources/extensions.dart';
import 'package:superformula_test/view/widgets/extended_menu_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _imageScale = 0;
  double _textXOffset = -3;

  @override
  void initState() {
    super.initState();
    setAnimationTimer();
  }

  void setAnimationTimer() {
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        _imageScale = 1;
        _textXOffset = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              duration: const Duration(seconds: 2),
              curve: Curves.bounceOut,
              scale: _imageScale,
              child: Image.asset('assets/superformula.jpeg'),
            ),
            AnimatedSlide(
              offset: Offset(_textXOffset, 0),
              duration: const Duration(seconds: 2),
              curve: Curves.easeOut,
              child: Text(
                'Superformula',
                style: context.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const ExtendedMenuFAB(),
    );
  }
}
