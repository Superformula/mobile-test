import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/images.dart';
import 'package:flutter_app/extensions/string_extension.dart';
import 'package:flutter_app/core/router.dart' as Router;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState(){

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(
      curve: Curves.easeInOut, parent: _animationController);

    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  Widget get fab {
    var theme = Theme.of(context);
    return FloatingActionBubble(
      items: [
        Bubble(
          title: 'home_screen_scan'.localize(context),
          iconColor :Colors.white,
          bubbleColor : theme.accentColor,
          icon: Icons.qr_code_scanner,
          titleStyle: theme.textTheme.bodyText1.copyWith(color: Colors.white),
          onPress: () {
            _animationController.reverse();
            Navigator.pushNamed(context, Router.ScanQRCodeScreenRoute);
          },
        ),
        Bubble(
          title: 'home_screen_generate'.localize(context),
          iconColor :Colors.white,
          bubbleColor : theme.accentColor,
          icon: Icons.create,
          titleStyle: theme.textTheme.bodyText1.copyWith(color: Colors.white),
          onPress: () {
            _animationController.reverse();
            Navigator.pushNamed(context, Router.GenerateQRCodeScreenRoute);
          },
        ),
      ],
      animation: _animation,
      onPress: () {
        _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward();
      },
      iconColor: theme.accentColor,
      icon: AnimatedIcons.menu_close,
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        textTheme: theme.textTheme,
        title: Text('home_screen_title'.localize(context))
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Image.asset(Images.home),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Text(
                'home_screen_message'.localize(context),
                style: theme.textTheme.headline5,
                textAlign: TextAlign.center)
            ),
          ],
        ),
      ),
      floatingActionButton: fab,
    );
  }
}