import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String data;

  QRCodeHeaderDelegate(this.data);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Center(
      child: QrImage(
        data: data,
        foregroundColor: Colors.white,
      ),
    );
  }

  @override
  double get maxExtent => 250;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class QRCodeHeader extends SliverPersistentHeader {
  final String data;

  QRCodeHeader(
    this.data, {
    super.key,
  }) : super(
          delegate: QRCodeHeaderDelegate(data),
        );
}
