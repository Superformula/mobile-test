import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan/scan.dart';

import '../../../generated/l10n.dart';
import '../../design_tokens/dimensions.dart';
import '../../routes/scan_seed/scan_seed_page_bloc.dart';

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
