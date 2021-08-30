import 'package:flutter/material.dart';
import 'package:get/get.dart';

///convenince folder for copy/pasting to create a new module/feature
class Module extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.responsiveValue(
      // mobile: ModuleMobile(),
    )!;
  }
}
