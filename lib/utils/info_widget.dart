import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key key,
    @required this.imagePath,
    @required this.message,
  }) : super(key: key);

  final String imagePath;
  final String message;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final imageSize = min(constraints.maxWidth, constraints.maxHeight) * 0.5;
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              imagePath,
              width: imageSize,
              fit: BoxFit.cover,
              placeholderBuilder: (_) => SizedBox(height: imageSize),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                message,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        ),
      );
    });
  }
}
