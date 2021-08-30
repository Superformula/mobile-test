import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {

  final VoidCallback? onPressed;
  final Widget icon;
  final String? label;

  const ActionButton({
    Key? key,
    this.onPressed,
    required this.icon,
    this.label
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: label != null
              ? EdgeInsets.only(right: 8)
              : null,
          child: label != null
              ? Card(
                elevation: 6,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                  child: Text(label!),
                ),
              )
              : null,
        ),
        Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          child: IconTheme.merge(
            data: Theme.of(context).accentIconTheme,
            child: IconButton(
              onPressed: onPressed,
              icon: icon,
            ),
          ),
        ),
      ],
    );
  }
}