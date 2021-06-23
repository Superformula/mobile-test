import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExpandableFab extends HookWidget {
  const ExpandableFab({
    Key? key,
    this.initialOpen = false,
    required this.children,
  }) : super(key: key);

  final bool initialOpen;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final isOpen = useState(initialOpen);
    final animationController = useAnimationController(
      initialValue: isOpen.value ? 1 : 0,
      duration: const Duration(milliseconds: 250),
    );

    void _toggle() {
      isOpen.value = !isOpen.value;
      if (isOpen.value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }

    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(context, onPressed: _toggle),
          ..._buildExpandingActionButtons(animationController),
          _buildTapToOpenFab(isOpen.value, onPressed: _toggle),
        ],
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons(AnimationController animation) {
    final children = <Widget>[];

    this.children.asMap().forEach((i, value) {
      children.add(
        _ExpandingActionButton(
          index: i,
          progress: CurvedAnimation(
            curve: Curves.fastOutSlowIn,
            reverseCurve: Curves.easeOutQuad,
            parent: animation,
          ),
          child: this.children[i],
        ),
      );
    });
    return children;
  }

  Widget _buildTapToCloseFab(BuildContext context,
      {required VoidCallback onPressed}) {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          elevation: 3,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.close,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTapToOpenFab(bool open, {required VoidCallback onPressed}) {
    return IgnorePointer(
      ignoring: open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          open ? 0.7 : 1.0,
          open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            onPressed: onPressed,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    Key? key,
    required this.index,
    required this.progress,
    required this.child,
  }) : super(key: key);

  final int index;

  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (BuildContext context, Widget? child) {
        return Positioned(
          bottom: 4.0 + (55 * (index + 1) * progress.value),
          right: 4.0,
          child: child ?? const SizedBox(),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}
