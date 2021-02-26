import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/src/core/styles/app_colors.dart';

// ignore_for_file: public_member_api_docs
/// Class that holds the TextStyles shared thorugh app
class AppTextStyle {
  static const purple = TextStyle(color: AppColors.purple);
  static const white = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );
  static const timer = TextStyle(
    color: Colors.white,
    fontSize: 120,
    fontFamily: 'digital7',
  );
  static const code = TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.italic,
    fontSize: 25,
  );
}
