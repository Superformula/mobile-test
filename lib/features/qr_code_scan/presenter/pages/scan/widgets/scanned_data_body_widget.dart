import 'package:flutter/material.dart';
import 'package:superformula_leandro/core/constants/strings_constants.dart';
import 'package:superformula_leandro/core/extensions/build_context_extension.dart';

class ScannedDataBodyWidget extends StatelessWidget {
  const ScannedDataBodyWidget({required this.data, super.key});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          StringsConstants.scannedData,
        ),
        const SizedBox(height: 24),
        Text(
          data,
          style: context.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
