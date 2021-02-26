import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qr_generator_flutter/src/core/styles/app_colors.dart';

///CircularActionButton with animation for various buttons
class AnimatedFloatingActionButton extends HookWidget {
  ///Circular button that recieve list of `butttons` to animate
  AnimatedFloatingActionButton({
    @required this.buttons,
  }) : assert(
          buttons.isNotEmpty || buttons.length > 3,
          'There should be 3 buttons maximum',
        );

  ///Buttons that will be animated
  ///`max of 3` buttons type [CircularButton]
  final List<CircularButton> buttons;

  double _getRadiansFromDegree(double degree) {
    const unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 250),
    );

    final _animations2 = [];

    ///* Generate the animations
    for (var i = 0; i < buttons.length; i++) {
      final doubleBeginEnd = 1.2 + i * 0.20;
      final weight1 = 75.0 - i * 20;
      final weight2 = 25.0 + i * 20;
      _animations2.add(
        useAnimation(
          TweenSequence([
            TweenSequenceItem<double>(
              tween: Tween<double>(begin: 0.0, end: doubleBeginEnd),
              weight: weight1,
            ),
            TweenSequenceItem<double>(
              tween: Tween<double>(begin: doubleBeginEnd, end: 1.0),
              weight: weight2,
            ),
          ]).animate(animationController),
        ),
      );
    }

    final _rotationAnimation =
        useAnimation(Tween<double>(begin: 180.0, end: 0.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    ));

    final _degrees = [270.0, 225.0, 180.0];

    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        IgnorePointer(
          child: Container(
            color: Colors.transparent,
            height: 150.0,
            width: 150.0,
          ),
        ),
        for (var i = 0; i < buttons.length; i++)
          Transform.translate(
            offset: Offset.fromDirection(
              _getRadiansFromDegree(_degrees[i]),
              _animations2[i] * 100,
            ),
            child: Transform(
              transform:
                  Matrix4.rotationZ(_getRadiansFromDegree(_rotationAnimation))
                    ..scale(
                      _animations2[i],
                    ),
              alignment: Alignment.center,
              child: buttons[i],
            ),
          ),
        Transform(
          transform:
              Matrix4.rotationZ(_getRadiansFromDegree(_rotationAnimation)),
          alignment: Alignment.center,
          child: CircularButton(
            key: const Key('kPrimaryFloatingButton'),
            color: AppColors.pink,
            icon: Icons.menu,
            onClick: () {
              if (animationController.isCompleted) {
                animationController.reverse();
              } else {
                animationController.forward();
              }
            },
          ),
        )
      ],
    );
  }
}

///Circular button with icon
class CircularButton extends StatelessWidget {
  ///Circular button that accepts an icon
  CircularButton({
    Key key,
    this.color = AppColors.purple,
    @required this.icon,
    @required this.onClick,
  }) : super(key: key);

  ///Button color
  final Color color;

  ///Button icon
  final IconData icon;

  ///Button on click callback
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: 50,
      height: 50,
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        enableFeedback: true,
        onPressed: onClick,
      ),
    );
  }
}
