import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'seconds_count_down.dart';

class QRCodeDisplay extends StatelessWidget {
  final String content;
  final int durationInSeconds;
  final Function onEnd;

  const QRCodeDisplay({
    Key? key,
    required this.content,
    required this.durationInSeconds,
    required this.onEnd
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
    child: Flex(
      direction: Axis.vertical,
      children: [
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: QrImage(
              data: content,
              version: QrVersions.auto,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: SecondsCountDown(
            seconds: durationInSeconds,
            onEnd: () => onEnd()
          ),
        ),
      ],
    )
  );
}