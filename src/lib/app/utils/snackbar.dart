import 'package:flutter/material.dart';

class SnackbarUtil {
  /// Shows a generic [Snackbar]
  static void showGenericSnackbar(
    BuildContext context,
    String text, {
    bool isError = false,
  }) {
    final scaffoldState = Scaffold.of(context);

    scaffoldState.hideCurrentSnackBar();

    scaffoldState.showSnackBar(
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
