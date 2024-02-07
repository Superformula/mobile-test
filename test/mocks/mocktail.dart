import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockQRViewController extends Mock implements QRViewController {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockRoute extends Fake implements Route {}
