import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_generator/index/index-bloc.dart';
import 'package:qr_generator/index/index-screen.dart';
import 'package:qr_generator/providers/bloc-provider.dart';

import '../app-mocks.dart';
import '../app-test-widget.dart';

main() {
  
  Key expandingFabKey = Key("expandingFab");
  Key scanCodeButtonKey = Key("scanCodeButton");
  Key generateCodeButtonKey = Key("generateCodeButton");
  Key permissionAlertDialogKey = Key("permissionAlertDialog");

  const QR_SCAN_SCREEN_ROUTE_NAME = "/qr-scan";
  const QR_GENERATOR_SCREEN_ROUTE_NAME = "/qr-generation";

  group("Index screen widget tests", () {

    late Widget underTest;

    late MockNavigatorObserver mockObserver;
    late MockPermissionWrapper mockPermissionWrapper;

    setUp(() {

      mockObserver = MockNavigatorObserver();
      mockPermissionWrapper = MockPermissionWrapper();

      underTest = AppTestWidget(
        child: BlocProvider(
          bloc: IndexBloc(),
          child: IndexScreen(
            permissionWrapper: mockPermissionWrapper
          ),
        ),
        mockNavigatorObserver: mockObserver,
        routes: {
          QR_SCAN_SCREEN_ROUTE_NAME: (context) => Container(),
          QR_GENERATOR_SCREEN_ROUTE_NAME: (context) => Container()
        }
      ).buildSut();
    });

    setUpAll(() {
      // instantiate non-null Route<dynamic> subtype for mockito to pass around in
      // mockObserver instance capturing
      registerFallbackValue(PageRouteBuilder(pageBuilder: (_, __, ___) => Container()));
    });

    testWidgets("Given an expanding speed dial and granted camera permission, when scan code button is tapped, then navigate to scan screen", (WidgetTester tester) async {
      
      // load widget
      await tester.pumpWidget(underTest);
      await tester.pumpAndSettle();

      // tap fab to open speed dial
      expect(find.byKey(expandingFabKey), findsOneWidget);
      await tester.tap(find.byKey(expandingFabKey));
      await tester.pumpAndSettle();

      // (setup) pre-authorize camera permission before prompt
      when(() => mockPermissionWrapper.requestCameraPermission())
          .thenAnswer((_) => Future.value(PermissionStatus.granted));

      // tap scan button
      expect(find.byKey(scanCodeButtonKey), findsOneWidget);
      await tester.tap(find.byKey(scanCodeButtonKey));
      await tester.pumpAndSettle();

      // verify we navigated to scan screen
      PageRoute route = verify(() => mockObserver.didPush(captureAny(), any())).captured.last;
      expect(route.settings.name, QR_SCAN_SCREEN_ROUTE_NAME);
    });

    testWidgets("Given an expanding speed dial and denied camera permission, when scan code button is tapped, then alert dialog is displayed", (WidgetTester tester) async {
      
      // load widget
      await tester.pumpWidget(underTest);
      await tester.pumpAndSettle();

      // tap fab to open speed dial
      expect(find.byKey(expandingFabKey), findsOneWidget);
      await tester.tap(find.byKey(expandingFabKey));
      await tester.pumpAndSettle();

      // (setup) pre-unauthorize camera permission before prompt
      when(() => mockPermissionWrapper.requestCameraPermission())
          .thenAnswer((_) => Future.value(PermissionStatus.denied));

      // tap scan button
      expect(find.byKey(scanCodeButtonKey), findsOneWidget);
      await tester.tap(find.byKey(scanCodeButtonKey));
      await tester.pumpAndSettle();

      // verify error dialog appeared
      expect(find.byKey(permissionAlertDialogKey), findsOneWidget);
    });

    testWidgets("Given an expanding speed dial, when code generation button is tapped, then navigate to generation screen", (WidgetTester tester) async {
      
      // load widget
      await tester.pumpWidget(underTest);
      await tester.pumpAndSettle();

      // tap fab to open speed dial
      expect(find.byKey(expandingFabKey), findsOneWidget);
      await tester.tap(find.byKey(expandingFabKey));
      await tester.pumpAndSettle();

      // tap generate button
      expect(find.byKey(generateCodeButtonKey), findsOneWidget);
      await tester.tap(find.byKey(generateCodeButtonKey));
      await tester.pumpAndSettle();

      // verify app navigated to generate page
      PageRoute route = verify(() => mockObserver.didPush(captureAny(), any())).captured.last;
      expect(route.settings.name, QR_GENERATOR_SCREEN_ROUTE_NAME);
    });
  });
}