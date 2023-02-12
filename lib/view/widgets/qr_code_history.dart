import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superformula_test/core/resources/extensions.dart';
import 'package:superformula_test/view/models/qr_code_seed_view_model.dart';

class QrCodeHistory extends StatelessWidget {
  const QrCodeHistory({super.key, required this.qrCodeList});

  final List<QrCodeSeedViewModel> qrCodeList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = qrCodeList[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Row(
                children: [
                  Flexible(
                      child: QrImage(
                    data: item.seed,
                    size: 50,
                  )),
                  if (item.expiresAt != null)
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Expired at: ${item.expiresAt!.toMMddYYYYHHmm}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                ],
              ),
            ),
          );
        },
        childCount: qrCodeList.length,
      ),
    );
  }
}
