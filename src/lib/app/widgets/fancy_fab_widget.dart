import 'package:flutter/material.dart';

class FancyFabWidget extends StatefulWidget {
  FancyFabWidget({
    Key key,
    this.tooltip,
    this.actions,
  }) : super(key: key);

  final String tooltip;
  final List<FancyFabAction> actions;

  static const double buttonSize = 60;
  static const double buttonSpacing = 10;

  @override
  _FancyFabWidgetState createState() => _FancyFabWidgetState();
}

class _FancyFabWidgetState extends State<FancyFabWidget>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;

  AnimationController _animationController;
  Animation<Color> _buttonColorAnimation;

  @override
  void initState() {
    if (widget.actions?.isNotEmpty == true) {
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
      );

      _buttonColorAnimation = ColorTween(
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
    }

    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
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

  @override
  Widget build(BuildContext context) {
    if (widget.actions?.isNotEmpty != true) {
      return Container(
        width: 0,
        height: 0,
      );
    }

    return AnimatedBuilder(
      animation: _animationController.view,
      builder: (BuildContext context, Widget child) {
        var items = new List<Widget>();
        items.addAll(List.generate(widget.actions.length, (index) {
          var action = widget.actions[index];

          final sizeFactor = widget.actions.length - index;

          final double bottom = _animationController.value == 0
              ? 0
              : (_animationController.value *
                      sizeFactor *
                      FancyFabWidget.buttonSize) +
                  (FancyFabWidget.buttonSpacing * sizeFactor);

          return Positioned(
            right: 0,
            height: FancyFabWidget.buttonSize,
            bottom: bottom,
            child: Row(
              children: [
                Opacity(
                  opacity: _animationController.value,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(action.label),
                  ),
                ),
                FloatingActionButton(
                  heroTag: index,
                  elevation: 0,
                  onPressed: action.onPressed,
                  tooltip: action.label,
                  child: Icon(action.icon),
                ),
              ],
            ),
          );
        }));

        items.add(
          Positioned(
            bottom: 0,
            right: 0,
            height: FancyFabWidget.buttonSize,
            width: FancyFabWidget.buttonSize,
            child: FloatingActionButton(
              heroTag: 'toggle',
              backgroundColor: _buttonColorAnimation.value,
              onPressed: animate,
              tooltip: widget.tooltip,
              elevation: 0,
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _animationController,
              ),
            ),
          ),
        );

        var fabSize = _animationController.value == 0
            ? FancyFabWidget.buttonSize
            : ((widget.actions.length + 1) * FancyFabWidget.buttonSize) +
                (FancyFabWidget.buttonSpacing * widget.actions.length + 1);

        return Container(
          width: _animationController.value == 0
              ? FancyFabWidget.buttonSize
              : null,
          height: fabSize,
          child: Stack(
            fit: StackFit.expand,
            children: items,
          ),
        );
      },
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
