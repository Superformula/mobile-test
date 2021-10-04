import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

class GenerateSeedPage extends StatelessWidget {
  const GenerateSeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).generateSeedPageTitle),
      ),
    );
  }
}
