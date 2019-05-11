import 'package:flutter/material.dart';

/// A page route that has no animation when entering the new route
/// Helpful to reduce jank when the new route presents a third party (i.e. camera or web view)
class NoEnterTransitionRoute extends MaterialPageRoute {
  NoEnterTransitionRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (animation.status == AnimationStatus.reverse) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    } else {
      return child;
    }
  }
}
