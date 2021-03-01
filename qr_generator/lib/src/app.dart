import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';

import 'features/home/views/home_page.dart';

/// Defines the [MaterialApp] widget which
/// contains all the general app configuration
class QRGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Generator',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: I18n(child: HomePage()),
    );
  }
}
