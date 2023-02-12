import 'package:flutter/material.dart';
import 'package:superformula_test/core/resources/extensions.dart';
import 'package:superformula_test/core/theme/app_colors.dart';

class QrCodeErrorMessage extends StatelessWidget {
  final String message;
  final VoidCallback onRefresh;

  const QrCodeErrorMessage({
    super.key,
    required this.message,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight,
      width: context.screenWidth,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'It was not possible to render the QR Code.\n$message',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            IconButton(
              onPressed: onRefresh,
              icon: const Icon(
                Icons.refresh,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
