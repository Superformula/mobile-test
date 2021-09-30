import 'package:flutter/material.dart';

class ExpandableFab extends StatefulWidget {
  const ExpandableFab({Key? key, required this.items}) : super(key: key);

  final List<ExpandableItem> items;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animateIcon;
  late final Animation<double> _expandAnimation;
  late bool _open;

  @override
  void initState() {
    _open = false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _animateIcon = Tween<double>(begin: 0, end: 1).animate(_controller);
    _expandAnimation = CurvedAnimation(
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
      parent: _controller,
    );
    super.initState();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...widget.items.map(
          (e) => _ExpandingActionButton(
            progress: _expandAnimation,
            child: e,
          ),
        ),
        FloatingActionButton(
          onPressed: _toggle,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animateIcon,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    Key? key,
    required this.progress,
    required this.child,
  }) : super(key: key);

  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) => Transform(
        transform: Matrix4.translationValues(
          0,
          progress.value,
          0,
        ),
        child: child,
      ),
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

class ExpandableItem extends StatelessWidget {
  const ExpandableItem({
    Key? key,
    this.message = '',
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final String message;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: theme.textTheme.bodyText1,
            ),
            const SizedBox(width: 8),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
