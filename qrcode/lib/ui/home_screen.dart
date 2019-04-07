import 'package:flutter/material.dart';
import 'package:qrcode/main.dart';

///
/// Initial app screen, used to jump to QRCode and Scan screens
///
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController _menuIconAnimationController;
  Animation<double> _animateIcon;
  bool _isOpened = false;

  AnimationController _buttonAnimationController;

  @override
  initState() {
    _buttonAnimationController =
        AnimationController(duration: const Duration(milliseconds: 500), vsync: this)
          ..addListener(() {
            setState(() {});
          });

    _menuIconAnimationController =
        AnimationController(duration: const Duration(milliseconds: 500), vsync: this)
          ..addListener(() {
            setState(() {});
          });
    _animateIcon = Tween<double>(begin: 0.0, end: 1.0).animate(_menuIconAnimationController);

    super.initState();
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    _menuIconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _handleScanPressed() => Navigator.pushNamed(context, QRCodeApp.NAV_SCAN_SCREEN);

    _handleQRCodePressed() => Navigator.pushNamed(context, QRCodeApp.NAV_QRCODE_SCREEN);

    _handleFABPressed() {
      if (!_isOpened) {
        _menuIconAnimationController.forward();
        _buttonAnimationController.forward();
      } else {
        _menuIconAnimationController.reverse();
        _buttonAnimationController.reverse();
      }
      _isOpened = !_isOpened;
    }

    Widget _menuWidget() {
      return new Container(
        child: FloatingActionButton(
          onPressed: _handleFABPressed,
          tooltip: 'Menu',
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animateIcon,
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ButtonAnimation("QRCode", _handleQRCodePressed, _buttonAnimationController.view),
              ButtonAnimation("Scan", _handleScanPressed, _buttonAnimationController.view),
              _menuWidget(),
            ],
          ),
        ));
  }
}

///
/// Animation to control buttons opacity and height as the appear and disappear when
/// menu button is pressed
///
class ButtonAnimation extends StatelessWidget {
  final Animation<double> _controller;
  Animation<double> opacity;
  Animation<double> _translateButton;
  String text;
  Function onPressed;

  ButtonAnimation(this.text, this.onPressed, this._controller) {
    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.100,
          curve: Curves.ease,
        ),
      ),
    );
    _translateButton = Tween<double>(
      begin: 50.0,
      end: -5.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.0,
        0.75,
        curve: Curves.ease,
      ),
    ));
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Transform(
      transform: Matrix4.translationValues(
        0.0,
        _translateButton.value,
        0.0,
      ),
      child: Opacity(
        opacity: opacity.value,
        child: OutlineButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: _controller,
    );
  }
}
