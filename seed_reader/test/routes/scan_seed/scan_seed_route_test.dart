import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:seed_reader/interactors/seed_interactor.dart';
import 'package:seed_reader/routes/scan_seed/scan_seed_page.dart';
import 'package:seed_reader/routes/scan_seed/scan_seed_route.dart';

import '../../common/base_testable_widget.dart';
import '../../mocks/mock_generator.mocks.dart';

late ScanRoute _route;
late MockSeedInteractor _seedInteractor;

void main() {
  setUp(() async {
    _route = const ScanRoute();
    _seedInteractor = MockSeedInteractor();

    await GetIt.I.reset();
    GetIt.I.registerSingleton<SeedInteractor>(_seedInteractor);
    _route = const ScanRoute();
  });
  testWidgets('#canHandle', (WidgetTester tester) async {
    expect(_route.canHandle('/foo'), false);
    expect(_route.canHandle('/scan'), true);
  });
  testWidgets('#handle', (WidgetTester tester) async {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

    await tester.pumpWidget(
      BaseWidgetTest(
        navigatorKey: navigatorKey,
      ),
    );
    await tester.pumpAndSettle();

    navigatorKey.currentState?.push<dynamic>(
      _route.handle<dynamic>(
        const RouteSettings(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(ScanSeedPage), findsOneWidget);
  });
}
