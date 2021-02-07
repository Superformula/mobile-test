import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:qr_app/pages/home/widgets/menu_item.dart';

enum MenuName { Scan, QRCode }

typedef OnMenuPress(MenuName menu);

class Menu extends StatefulWidget {
  Menu({
    @required this.onPress,
  }) : assert(onPress != null);
  final OnMenuPress onPress;
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _scanSlideAnim;
  Animation<Offset> _qrSlideAnim;
  Animation<double> _scanFadeAnim;
  Animation<double> _qrFadeAnim;
  Animation<double> _rotateAnim;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _scanSlideAnim = Tween<Offset>(begin: Offset(0, 2), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(
              0.0,
              1.0,
              curve: Curves.ease,
            )));

    _scanFadeAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.3,
          curve: Curves.ease,
        )));
    _qrSlideAnim = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(
              0.3,
              1.0,
              curve: Curves.ease,
            )));
    _qrFadeAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.3,
          0.5,
          curve: Curves.ease,
        )));
    _rotateAnim =
        Tween<double>(begin: 0, end: math.pi / 4).animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(
              0.0,
              1.0,
              curve: Curves.ease,
            )));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onMenuShowHide() {
    if (_controller.status == AnimationStatus.completed)
      _controller.reverse();
    else
      _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MenuItem(
          fadeAnimation: _scanFadeAnim,
          slideAnimation: _scanSlideAnim,
          title: 'Scan',
          icon: Icons.scatter_plot_rounded,
          onPressed: () => widget.onPress(MenuName.Scan),
        ),
        SizedBox(
          height: 10,
        ),
        MenuItem(
          fadeAnimation: _qrFadeAnim,
          slideAnimation: _qrSlideAnim,
          title: 'QR Code',
          icon: Icons.qr_code,
          onPressed: () => widget.onPress(MenuName.QRCode),
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          heroTag: 'main-menu',
          onPressed: _onMenuShowHide,
          child: AnimatedBuilder(
            animation: _rotateAnim,
            builder: (context, snapshot) {
              return Transform.rotate(
                angle: _rotateAnim.value,
                child: Icon(Icons.add),
              );
            },
          ),
        )
      ],
    );
  }
}
