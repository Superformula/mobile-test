import 'package:flutter/material.dart';

/// Simple widget that shows a custom message and a success/failure icon at the
/// top.
class ValidationAlert extends StatelessWidget {
  /// Determines whether the validation failed or not
  final bool success;
  /// The message to be shown underneath the icon
  final String message;
  /// Requires a `bool` indicating the success and the associated message
  const ValidationAlert({
    @required this.message,
    @required this.success,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (success)
          const Icon(Icons.check_circle,
            color: Colors.green,
            size: 80,
          ),

        if (!success)
          const Icon(Icons.warning,
            color: Colors.redAccent,
            size: 80,
          ),

        const SizedBox(
          height: 20,
        ),

        Text(message,
          style: const TextStyle(
            fontSize: 30,
          ),
        )
      ],
    );
  }
}