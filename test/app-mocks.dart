import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_generator/permissions/permission-wrapper.dart';
import 'package:qr_generator/services/app-backend-client.dart';

class MockAppBackendClient extends Mock implements AppBackendClient {}
class MockNavigatorObserver extends Mock implements NavigatorObserver {}
class MockPermissionWrapper extends Mock implements PermissionWrapper {}
