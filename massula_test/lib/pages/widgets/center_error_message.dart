import 'package:flutter/material.dart';
import 'package:massula_test/resources/string_constant.dart';

class CenterErrorMessage extends StatelessWidget {
  final String message;
  final Function action;
  const CenterErrorMessage({
    Key? key,
    required this.message,
    required this.action
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(
          Icons.error,
          color: Theme.of(context).errorColor,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
        child: Text(message),
      ),
      OutlinedButton(
        onPressed: () => action(),
        child: Text(StringConstant.GENERIC_RETRY)
      )
    ],
  );
}