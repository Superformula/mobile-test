import 'package:logger/logger.dart';

/// Wrapper class for a Logger
class Log {
  static final Logger _logger = Logger(
      printer: PrettyPrinter(
          errorMethodCount: 8,
          lineLength: 120,
          colors: true,
          printEmojis: true,
          printTime: true
      ),
      level: Level.nothing
  );

  static void v(String tag, String msg) {
    _logger.v('$tag: $msg');
  }

  static void d(String tag, String msg) {
    _logger.d('$tag: $msg');
  }

  static void i(String tag, String msg) {
    _logger.i('$tag: $msg');
  }

  static void w(String tag, String msg) {
    _logger.w('$tag: $msg');
  }

  static void e(String tag, String msg) {
    _logger.e('$tag: $msg');
  }

  static void wtf(String tag, String msg) {
    _logger.wtf('$tag: $msg');
  }
}