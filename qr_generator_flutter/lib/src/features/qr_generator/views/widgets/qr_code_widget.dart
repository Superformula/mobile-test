import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:qr_generator/qr_generator.dart';
import 'package:qr_generator_flutter/src/core/styles/app_colors.dart';

///Widgets that generate the qr image base on seed
class QrCodeWidget extends StatelessWidget {
  /// QrImage from a `CustomPainter`
  QrCodeWidget({
    Key key,
    this.seed,
  }) : super(key: key);

  /// Seed object from wich the qrcode will be generated
  final Seed seed;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: _loadOverlayImage(),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        }
        return CustomPaint(
          key: const Key('QrWidget'),
          size: const Size.square(280),
          painter: _QrPainter(
            image: snapshot.data,
            seed: seed.seed,
          ),
        );
      },
    );
  }

  //* Loads asset image of superFormula Logo
  Future<ui.Image> _loadOverlayImage() async {
    final completer = Completer<ui.Image>();
    final byteData = await rootBundle.load('assets/images/logo.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }
}

/// Class that return a `QrPainter` with styles
class _QrPainter extends QrPainter {
  _QrPainter({
    @required ui.Image image,
    @required String seed,
  }) : super(
          data: seed,
          version: QrVersions.auto,
          eyeStyle: const QrEyeStyle(
            eyeShape: QrEyeShape.square,
            color: AppColors.green,
          ),
          dataModuleStyle: const QrDataModuleStyle(
            dataModuleShape: QrDataModuleShape.circle,
            color: AppColors.pink,
          ),
          // size: 320.0,
          embeddedImage: image,
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: const Size.square(60),
          ),
        );
}
