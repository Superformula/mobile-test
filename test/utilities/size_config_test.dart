import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/src/utilities/size_config.dart';
import 'package:mockito/mockito.dart';

import '../mock_set_up/mock_classes.dart';

void main() {
  test('Test Size config calculations for various device sizes', () async {
    final MockBuildContext mockContext = MockBuildContext();
    const MediaQueryData mediaQueryData = MediaQueryData(
        size: Size(758, 450), devicePixelRatio: 2, padding: EdgeInsets.all(10));
    const MediaQuery mediaQuery = MediaQuery(
        data: mediaQueryData, child: Text('Testing different devices'));

    when(mockContext.dependOnInheritedWidgetOfExactType())
        .thenReturn(mediaQuery);
    expect(getDeviceWidth(mockContext), 758.0);
    expect(getDeviceHeight(mockContext), 450.0);
    expect(getDevicePixelRatio(mockContext), 2);
    expect(getDeviceOrientation(mockContext), Orientation.landscape);
    expect(getSafeBlockVertical(mockContext), 4.3);
    expect(getSafeBlockHorizontal(mockContext), 7.38);
    expect(getSafeAreaVertical(mockContext), 20.0);
    expect(getSafeAreaHorizontal(mockContext), 20.0);
    expect(getBlockSizeVertical(mockContext), 4.5);
    expect(getBlockSizeHorizontal(mockContext), 7.58);

    const MediaQueryData mediaQueryDataSmall = MediaQueryData(
        size: Size(320, 568),
        devicePixelRatio: 3,
        padding: EdgeInsets.only(left: 20, right: 10, bottom: 5, top: 5));
    const MediaQuery mediaQuerySmall = MediaQuery(
        data: mediaQueryDataSmall, child: Text('Testing small devices'));

    when(mockContext.dependOnInheritedWidgetOfExactType())
        .thenReturn(mediaQuerySmall);
    expect(getDeviceWidth(mockContext), 320.0);
    expect(getDeviceHeight(mockContext), 568.0);
    expect(getDevicePixelRatio(mockContext), 3);
    expect(getDeviceOrientation(mockContext), Orientation.portrait);
    expect(getSafeBlockVertical(mockContext), 5.58);
    expect(getSafeBlockHorizontal(mockContext), 2.9);
    expect(getSafeAreaVertical(mockContext), 10.0);
    expect(getSafeAreaHorizontal(mockContext), 30.0);
    expect(getBlockSizeVertical(mockContext), 5.68);
    expect(getBlockSizeHorizontal(mockContext), 3.2);
  });
}
