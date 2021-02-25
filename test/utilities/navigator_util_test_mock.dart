import 'package:flutter/material.dart';
import 'package:mobile_test/src/utilities/navigator_util.dart';
import 'package:mockito/mockito.dart';

import '../mock_set_up/mock_classes.dart';

MockNavigatorUtil mockNavigatorUtil({String screenText = 'NEXT SCREEN'}) {
  final MockNavigatorUtil navigator = MockNavigatorUtil();

  NavigatorUtil.singleton = navigator;
  when(navigator.push(any, any)).thenAnswer((Invocation invocation) {
    return Navigator.push<dynamic>(
      invocation.positionalArguments[0],
      MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => Text(screenText)),
    );
  });
  return navigator;
}
