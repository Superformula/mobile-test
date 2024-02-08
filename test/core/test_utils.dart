import 'package:flutter/material.dart';

sealed class TestUtils {
  static void ignoreOverflowErrors(
    FlutterErrorDetails details, {
    bool forceReport = false,
  }) {
    bool ifIsOverflowError = false;
    var exception = details.exception;
    if (exception is FlutterError) {
      ifIsOverflowError = !exception.diagnostics.any(
        (e) => e.value.toString().startsWith("A RenderFlex overflowed by"),
      );
    }
    if (ifIsOverflowError) {
      debugPrint('Ignored Error');
    } else {
      FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
    }
  }
}
