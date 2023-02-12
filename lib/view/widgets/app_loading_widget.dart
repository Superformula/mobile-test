import 'package:flutter/material.dart';
import 'package:superformula_test/core/resources/extensions.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key, this.isFullScreen = false});

  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullScreen ? context.screenWidth : null,
      height: isFullScreen ? context.screenHeight : null,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
