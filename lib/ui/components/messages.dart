import 'package:flutter/material.dart';

/// The ErrorMessage is common component within the application to display a
/// simple white text message on a red background.
class ErrorMessage extends StatelessWidget {
  final String errMsg;

  const ErrorMessage(this.errMsg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Text(
        errMsg,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
