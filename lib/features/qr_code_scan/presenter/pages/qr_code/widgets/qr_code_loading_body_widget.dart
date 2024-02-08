import 'package:flutter/material.dart';
import 'package:superformula_leandro/core/extensions/build_context_extension.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/pages/qr_code/widgets/shimmer_widget.dart';

class QrCodeLoadingBodyWidget extends StatelessWidget {
  const QrCodeLoadingBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShimmerWidget(dimension: context.screenWidth * .8),
        const SizedBox(height: 16),
        const ShimmerWidget(dimension: 32),
      ],
    );
  }
}
