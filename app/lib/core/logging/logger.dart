library logger;

import 'package:logger/logger.dart';

export 'package:logger/logger.dart';

// NOTE: We export the logger plugin api above so we
// don't have to import both files everywhere.
// We can just import this file and we get everthing.

///
/// Our global accessor for creating a logger instance.
///
Logger getLogger(String className) {
  return Logger(printer: _LogPrinter(className));
}

// Our custom log printer.
// We format the message and then call the base class to output.
class _LogPrinter extends LogPrinter {
  final String className;
  _LogPrinter(this.className);

  @override
  void log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    println(color('$className - $event.message'));
  }
}
