import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({required this.dimension, super.key});

  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      period: const Duration(seconds: 1),
      child: SizedBox.square(
        dimension: dimension,
        child: Container(
          color: Colors.grey,
        ),
      ),
    );
  }
}
