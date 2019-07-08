import 'package:flutter/material.dart';
import 'package:super_qr/models/seed.dart';
import 'package:super_qr/providers/seed_data_provider.dart';
import 'package:super_qr/ui/components/qr_widget_view.dart';
import 'package:super_qr/utils/constants.dart';

/// Page that will display a QR code and its timer.
class QRDisplayView extends StatefulWidget {
  @override
  _QRDisplayViewState createState() => _QRDisplayViewState();
}

class _QRDisplayViewState extends State<QRDisplayView> {
  SeedDataProvider seedProvider;

  @override
  void initState() {
    super.initState();

    // Contemplated making this across the app or only while on this view.
    // Since we currently don't need this data anywhere else except on this view,
    // and have no intention of ever changing that, we're going to keep it here.
    seedProvider = SeedDataProvider();
  }

  @override
  void dispose() {
    seedProvider.stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          VIEW_A_QR_CODE_PAGE_TITLE,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: seedProvider.currentSeed,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  Seed currentSeed = snapshot.data;
                  // TODO: Add fade animation for change.
                  return Column(
                    children: [
                      // QR Code display row
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            QRImageView(
                              seed: currentSeed,
                            )
                          ]),
                      // Expires timer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // TODO: Extract widget
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '15s',
                              style: textTheme.display1,
                            ),
                          )
                        ],
                      )
                    ],
                  );
                } else {
                  // TODO: Error handling.
                  return Text('Loading QR Code.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
