import 'package:flutter/material.dart';

/// This widget simply shows an icon on the left and some text on the right
class IconAndText extends StatelessWidget {
  /// The icon
  final Icon icon;
  /// The text
  final String text;

  /// Requires an [icon] and a [text] that will appear next to it
  const IconAndText({
    @required this.icon,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,

          const SizedBox(
            width: 20,
          ),

          Text(text,
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 1.2
            ),
          ),
        ],
      ),
    );
  }
}