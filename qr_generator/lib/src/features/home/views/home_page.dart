import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../qr_gen/views/qr_gen_page.dart';
import '../../qr_scan/logic/qr_scan_provider.dart';
import '../../qr_scan/views/qr_scan_page.dart';

import 'home_page.i18n.dart';
import 'widgets/expandable_fab.dart';

/// Starting point of the app.
class HomePage extends StatelessWidget {
  /// Static method to return the widget as a PageRoute
  static Route go() => MaterialPageRoute<void>(builder: (_) => HomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kHomeMessage.i18n)),
      body: const _ScannedItemsConsumer(),
      floatingActionButton: ExpandableFab(
        distance: 112,
        children: [
          ActionButton(
            onPressed: () async {
              await Navigator.of(context).push(QRCodeGeneratorPage.go());
            },
            icon: const Icon(Icons.qr_code_outlined),
          ),
          ActionButton(
            onPressed: () async {
              await Navigator.of(context).push(QRCodeScanPage.go());
            },
            icon: const Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}

class _ScannedItemsConsumer extends ConsumerWidget {
  const _ScannedItemsConsumer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(qrScanNotifierProvider.state);

    return state.maybeWhen(
      scanned: (decodedStrings) {
        return ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: decodedStrings.length,
          itemBuilder: (_, index) {
            final decode = decodedStrings[index];
            return Card(child: ListTile(title: Text(decode)));
          },
        );
      },
      orElse: () => Center(
        child: Text(
          kNoItemsMessage.i18n,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
