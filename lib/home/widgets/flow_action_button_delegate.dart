import 'package:flutter/widgets.dart';

class FlowActionButtonDelegate extends FlowDelegate {
  FlowActionButtonDelegate({
    required this.animation,
  }) : super(repaint: animation);

  final AnimationController animation;

  @override
  void paintChildren(FlowPaintingContext context) {
    const buttonSize = 56;
    const buttonRadius = buttonSize / 2;
    const buttonMarging = 10;

    final positionX = context.size.width - buttonSize;
    final positionY = context.size.height - buttonSize;
    final lastIndex = context.childCount - 1;

    for (var i = lastIndex; i >= 0; i--) {
      final y =
          positionY - ((buttonSize + buttonMarging) * i * animation.value);
      final size = (i != 0) ? animation.value : 1.0;

      context.paintChild(
        i,
        transform: Matrix4.translationValues(positionX, y, 0)
          // Starts the animation translate scale from center
          ..translate(buttonRadius, buttonRadius)
          ..scale(size)
          ..translate(-buttonRadius, -buttonRadius),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}
