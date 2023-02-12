import 'package:flutter/material.dart';
import 'package:superformula_test/core/theme/app_colors.dart';

class AppSnackBar {
  final String content;

  AppSnackBar(this.content);

  void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('QR Code data: $content'),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
