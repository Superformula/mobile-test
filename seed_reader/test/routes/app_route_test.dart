import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seed_reader/generated/l10n.dart';
import 'package:seed_reader/routes/app_route.dart';

import '../common/base_testable_widget.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
void main() {
  group('#onGenerateRoute', () {
    testWidgets(
      'when the route not exists then renders the default route',
      (WidgetTester tester) async {
        await tester.pumpPage();

        expect(find.text(S.current.unknownRouteMessage), findsOneWidget);
      },
    );

    testWidgets(
      'when the route exists then renders the route',
      (WidgetTester tester) async {
        await tester.pumpPage();

        _navigatorKey.currentState?.pushNamed('/foo');
        await tester.pumpAndSettle();

        expect(find.text('Foo'), findsOneWidget);
      },
    );
  });
}

extension _Pump on WidgetTester {
  Future<void> pumpPage() async {
    await pumpWidget(
      BaseWidgetTest(
        routes: <AppRoute>[
          _FooRoute(),
        ],
        navigatorKey: _navigatorKey,
      ),
    );
    await pumpAndSettle();
  }
}

class _FooRoute implements AppRoute {
  @override
  bool canHandle(String route) => route == '/foo';

  @override
  Route<T> handle<T>(RouteSettings settings) => MaterialPageRoute<T>(
        builder: (_) => const Text('Foo'),
      );
}
