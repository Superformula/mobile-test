import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superformula_test/modules/home/views/home_mobile.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.responsiveValue(
      mobile: HomeMobile(),
      //tablet: HomeTablet(),
    )!;
  }
}
