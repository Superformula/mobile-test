import 'package:flutter/material.dart';
import 'package:super_qr/models/seed.dart';
import 'package:super_qr/providers/seed_data_provider.dart';
import 'package:super_qr/utils/constants.dart';

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
          children: [
            StreamBuilder(
              stream: seedProvider.currentSeed,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  Seed currentSeed = snapshot.data;
                  return Text(currentSeed.seed);
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
