import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  MenuItem(
      {@required this.title,
      @required this.icon,
      @required this.onPressed,
      @required this.slideAnimation,
      @required this.fadeAnimation})
      : assert(title != null),
        assert(icon != null),
        assert(onPressed != null),
        assert(slideAnimation != null),
        assert(fadeAnimation != null);
  final String title;
  final IconData icon;
  final Function onPressed;
  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 5,
            ),
            FloatingActionButton(
              child: Icon(icon),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
