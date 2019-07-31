import 'package:flutter/material.dart';
import 'package:qrgenerator/app/intl/app_strings.dart';
import 'package:unicorndial/unicorndial.dart';

class MultiFab extends StatelessWidget {
  final VoidCallback onScan;
  final VoidCallback onGenerate;

  MultiFab({
    this.onScan,
    this.onGenerate,
  });

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);
    return UnicornDialer(
      hasBackground: false,
      parentButton: Icon(Icons.add),
      childButtons: [
        UnicornButton(
          hasLabel: true,
          labelText: strings.scan,
          currentButton: FloatingActionButton(
            heroTag: "scan",
            mini: true,
            child: Icon(Icons.camera_alt),
            onPressed: onScan,
          ),
        ),
        UnicornButton(
          hasLabel: true,
          labelText: strings.generate,
          currentButton: FloatingActionButton(
            heroTag: "generate",
            mini: true,
            child: Icon(Icons.memory),
            onPressed: onGenerate,
          ),
        ),
      ],
    );
  }
}
