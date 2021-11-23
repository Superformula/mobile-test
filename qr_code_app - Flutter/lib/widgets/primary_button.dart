import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final GestureTapCallback? onPressed;

  const PrimaryButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.disabled)
                    ? Colors.blue.withOpacity(0.5)
                    : Colors.blue,
          ),
        ),
        key: UniqueKey(),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
