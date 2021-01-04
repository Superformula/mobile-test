import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_test/blocs/slider/slider.dart';

/// Bloc that handles the position of a menu in the home page. In particular,
/// it handles a sliding menu that appears and disappears from a side of the
/// screen.
///
/// The state emitted by this bloc is the `right` coordinate for a [Positioned]
/// or [AnimatedPositioned] widget.
///
/// When the state is a **negative** double, the menu is hidden. When the state
/// is a **positive** double, the menu is visible.
class SliderBloc extends Bloc<ToggleSlider, double> {
  /// The width of the widget menu
  final double menuWidth;

  /// [menuWidth] is the width of the widget containing the menu
  SliderBloc({
    @required this.menuWidth,
  }) : super(-menuWidth);

  @override
  Stream<double> mapEventToState(ToggleSlider event) async* {
    if (state == -menuWidth) {
      // Visible
      yield 16.0;
    } else {
      // Hidden
      yield -menuWidth;
    }
  }
}