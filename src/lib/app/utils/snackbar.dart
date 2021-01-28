import 'package:flutter/material.dart';

class SnackbarUtil {
  /// Shows a generic [Snackbar]
  static void showGenericSnackbar(
    BuildContext context,
    String text, {
    bool isError = false,
  }) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red : null,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
