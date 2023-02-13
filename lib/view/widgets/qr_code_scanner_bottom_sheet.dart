import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_test/core/resources/extensions.dart';
import 'package:superformula_test/core/theme/app_colors.dart';
import 'package:superformula_test/view/blocs/qr_code_validation_bloc/qr_code_validation_bloc.dart';
import 'package:superformula_test/view/widgets/app_loading_widget.dart';

class QRCodeScannerBottomSheet extends StatelessWidget {
  final String data;

  const QRCodeScannerBottomSheet({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QRCodeValidationCubit, QRCodeValidationState>(
      builder: (context, state) {
        return SizedBox(
          width: context.screenWidth,
          height: context.screenHeight * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (state is QRCodeValidationLoadingState)
                  const AppLoadingWidget(),
                if (state is QRCodeValidationSuccessState) ...[
                  if (!state.isValid)
                    Text(
                      'It was not possible to validate the QR Code.',
                      style: context.textTheme.titleLarge!
                          .copyWith(color: AppColors.primary),
                    ),
                  if (state.isValid) ...[
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'QR Code validated successfully!',
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleLarge!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: 'Here is the data: ',
                          style: context.textTheme.bodyLarge!
                              .copyWith(color: Colors.black),
                          children: [
                            TextSpan(
                              text: data,
                              style: context.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w900,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
