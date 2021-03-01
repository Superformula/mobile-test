import 'package:flutter/material.dart';

///
/// * [Message]
///
class Message extends StatelessWidget {
  /// Shows a padded text with `headline6` style.
  const Message({Key key, @required this.label}) : super(key: key);

  /// Text to show on message.
  final String label;

  @override
  Widget build(BuildContext context) {
    final h6 = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(label, style: h6, textAlign: TextAlign.center),
    );
  }
}
