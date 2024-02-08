import 'package:flutter/material.dart';
import 'package:superformula_leandro/core/extensions/build_context_extension.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    required void Function() voidCallback,
    required this.text,
    super.key,
  }) : _voidCallback = voidCallback;

  final void Function() _voidCallback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        style: const ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8,
                ),
              ),
            ),
          ),
        ),
        onPressed: _voidCallback,
        child: Text(
          text,
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
