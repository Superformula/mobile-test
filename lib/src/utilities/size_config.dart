import 'package:flutter/material.dart';

MediaQueryData _mediaQueryData;
double _screenWidth;
double _screenHeight;
double _devicePixelRatio;
Orientation _orientation;
bool _accessibility;

double _blockSizeHorizontal;
double _blockSizeVertical;

double _safeAreaHorizontal;
double _safeAreaVertical;
double _safeBlockHorizontal;
double _safeBlockVertical;

void sizeConfigInit(BuildContext context) {
  _mediaQueryData = MediaQuery.of(context);
  _screenWidth = _mediaQueryData.size.width;
  _screenHeight = _mediaQueryData.size.height;
  _devicePixelRatio = _mediaQueryData.devicePixelRatio;
  _orientation = _mediaQueryData.orientation;
  _accessibility = _mediaQueryData.accessibleNavigation;
  _blockSizeHorizontal = _screenWidth / 100;
  _blockSizeVertical = _screenHeight / 100;

  _safeAreaHorizontal =
      _mediaQueryData.padding.left + _mediaQueryData.padding.right;
  _safeAreaVertical =
      _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
  _safeBlockHorizontal = (_screenWidth - _safeAreaHorizontal) / 100;
  _safeBlockVertical = (_screenHeight - _safeAreaVertical) / 100;
}

double getDeviceWidth(BuildContext context) {
  sizeConfigInit(context);
  return _screenWidth;
}

double getDeviceHeight(BuildContext context) {
  sizeConfigInit(context);
  return _screenHeight;
}

double getDevicePixelRatio(BuildContext context) {
  sizeConfigInit(context);
  return _devicePixelRatio;
}

Orientation getDeviceOrientation(BuildContext context) {
  sizeConfigInit(context);
  return _orientation;
}

bool getDeviceAccessibility(BuildContext context) {
  sizeConfigInit(context);
  return _accessibility;
}

double getBlockSizeHorizontal(BuildContext context) {
  sizeConfigInit(context);
  return _blockSizeHorizontal;
}

double getBlockSizeVertical(BuildContext context) {
  sizeConfigInit(context);
  return _blockSizeVertical;
}

double getSafeAreaHorizontal(BuildContext context) {
  sizeConfigInit(context);
  return _safeAreaHorizontal;
}

double getSafeAreaVertical(BuildContext context) {
  sizeConfigInit(context);
  return _safeAreaVertical;
}

double getSafeBlockHorizontal(BuildContext context) {
  sizeConfigInit(context);
  return _safeBlockHorizontal;
}

double getSafeBlockVertical(BuildContext context) {
  sizeConfigInit(context);
  return _safeBlockVertical;
}
