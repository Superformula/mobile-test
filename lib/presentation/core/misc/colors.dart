import 'package:flutter/material.dart';

const superformulaPrimaryColor = Color.fromRGBO(233, 97, 123, 1);
const superformulaSecondaryColor = Color.fromRGBO(110, 224, 162, 1);
const superformulaBackgroundColor = Color.fromRGBO(35, 35, 35, 1);

/// Creates a MaterialColor based on the [color] parameter,
/// it automatically generates a ColorSwatch property based on different shades
/// of [color]. The swatch is NOT based on Opacity gradient
MaterialColor createMaterialColor(Color color) {
  final swatch = <int, Color>{};
  final List strengths = <double>[.05];
  final r = color.red;
  final g = color.green;
  final b = color.blue;

  // Building the shades referemce
  for (var i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  // Here we are creating the swatch to be used by the MaterialColor constructor
  for (final strength in strengths) {
    final ds = 0.5 - (strength as num);
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
