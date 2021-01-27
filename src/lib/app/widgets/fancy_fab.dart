import 'package:flutter/material.dart';

/// Source: https://medium.com/@agungsurya/create-a-simple-animated-floatingactionbutton-in-flutter-2d24f37cfbcc
/// With adaptations.
class FancyFab extends StatefulWidget {
  final String tooltip;
  final List<FancyFabAction> actions;

  FancyFab({
    this.tooltip,
    this.actions,
  });

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.purple,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget toggle() {
    return FloatingActionButton(
      backgroundColor: _buttonColor.value,
      onPressed: animate,
      tooltip: widget.tooltip,
      elevation: 0,
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _animateIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var buttons = List<Widget>();

    if (widget.actions?.isNotEmpty == true) {
      buttons.addAll(
        List.generate(
          widget.actions.length,
          (index) {
            var action = widget.actions[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform(
                  transform: Matrix4.translationValues(
                    0.0,
                    _translateButton.value * (widget.actions.length - index),
                    0.0,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 100),
                      opacity: _animateIcon.value,
                      child: Text(action.label),
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                    0.0,
                    _translateButton.value * (widget.actions.length - index),
                    0.0,
                  ),
                  child: FloatingActionButton(
                    tooltip: action.label,
                    child: Icon(action.icon),
                    elevation: 0,
                    onPressed: action.onPressed,
                    heroTag: index,
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

    buttons.add(toggle());

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: buttons,
    );
  }
}

class FancyFabAction {
  String label;
  IconData icon;
  Function onPressed;

  FancyFabAction({
    this.label,
    this.icon,
    this.onPressed,
  });
}
