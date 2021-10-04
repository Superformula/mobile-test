import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

class ScanSeedPage extends StatelessWidget {
  const ScanSeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).scanPageTitle),
      ),
    );
  }
}
