import 'package:flutter/material.dart';

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        home: widget,
      ));
}
