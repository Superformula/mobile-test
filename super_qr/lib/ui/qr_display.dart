import 'package:flutter/material.dart';
import 'package:super_qr/models/seed.dart';
import 'package:super_qr/providers/seed_data_provider.dart';
import 'package:super_qr/ui/components/qr_code_countdown.dart';
import 'package:super_qr/ui/components/qr_widget_view.dart';
import 'package:super_qr/utils/constants.dart';

/// Page that will display a QR code and its timer.
class QRDisplayView extends StatefulWidget {
  @override
  _QRDisplayViewState createState() => _QRDisplayViewState();
}

class _QRDisplayViewState extends State<QRDisplayView>
    with SingleTickerProviderStateMixin {
  SeedDataProvider seedProvider;
  Seed currentSeed;

  AnimationController fadeInController;
  Animation<double> fadeInAnimation;

  @override
  void initState() {
    super.initState();

    // Contemplated making this across the app or only while on this view.
    // Since we currently don't need this data anywhere else except on this view,
    // and have no intention of ever changing that, we're going to keep it here.
    seedProvider = SeedDataProvider();

    // Animation for fading in new QR code
    fadeInController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    fadeInAnimation =
        CurvedAnimation(parent: fadeInController, curve: Curves.ease);
  }

  @override
  void dispose() {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: seedProvider.currentSeed,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  currentSeed = snapshot.data;

                  // TODO: Cleanup initial animation.
                  fadeInController.reset();
                  fadeInController.forward();

                  return FadeTransition(
                    child: Column(
                      children: [
                        // QR Code display row
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              QRImageView(
                                seed: currentSeed,
                              )
                            ]),
                        // Expires at timer
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: QRDisplayCountdown(
                                  seedExpiresAt: currentSeed.expiresAt,
                                ))
                          ],
                        )
                      ],
                    ),
                    opacity: fadeInAnimation,
                  );
                } else if (snapshot.hasError) {
                  return Text('Error loading QR Code.');
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
