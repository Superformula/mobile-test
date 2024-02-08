import 'package:flutter/material.dart';
import 'package:superformula_leandro/core/extensions/build_context_extension.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({required this.errorMessage, super.key});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning_rounded,
          size: context.screenWidth * .5,
          color: Colors.red,
        ),
        const SizedBox(height: 16),
        Text(
          errorMessage,
          style: context.textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
