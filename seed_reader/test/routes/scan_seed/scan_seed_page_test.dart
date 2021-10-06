import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:scan/scan.dart';
import 'package:seed_reader/generated/l10n.dart';
import 'package:seed_reader/models/seed.dart';
import 'package:seed_reader/routes/scan_seed/scan_seed_page.dart';
import 'package:seed_reader/routes/scan_seed/scan_seed_page_bloc.dart';
import '../../common/base_testable_widget.dart';
import '../../mocks/mock_generator.mocks.dart';

late MockSeedInteractor _seedInteractorMock;
late ScanSeedPageBloc _seedBloc;

void main() {
  setUp(() {
    _seedInteractorMock = MockSeedInteractor();
    _seedBloc = ScanSeedPageBloc(seedInteractor: _seedInteractorMock);
  });
  testWidgets('render components', (WidgetTester tester) async {
    await tester.pumpPage();

    expect(find.text(S.current.scanPageTitle), findsOneWidget);
    expect(find.byType(ScanView), findsOneWidget);
  });
  testWidgets('when reads a valid seed then renders ui feedback',
      (WidgetTester tester) async {
    final Seed seed = Seed(
      value: '',
      expiration: DateTime.now(),
    );
    when(_seedInteractorMock.isValid(seed)).thenReturn(true);

    _seedBloc.validateSeed(json.encode(seed));
    await tester.pumpPage();

    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });
  testWidgets('when reads an invalid seed then renders ui feedback',
      (WidgetTester tester) async {
    final Seed seed = Seed(
      value: '',
      expiration: DateTime.now(),
    );
    when(_seedInteractorMock.isValid(seed)).thenReturn(false);
    await tester.pumpPage();

    _seedBloc.validateSeed(json.encode(seed));
    await tester.pumpPage();

    expect(find.byIcon(Icons.error), findsOneWidget);
  });
}

extension _Pump on WidgetTester {
  Future<void> pumpPage() async {
    await pumpWidget(
      BaseWidgetTest(
        child: MultiProvider(
          providers: <SingleChildWidget>[
            Provider<ScanSeedPageBloc>(
              create: (_) => _seedBloc,
            )
          ],
          child: const ScanSeedPage(),
        ),
      ),
    );
    await pumpAndSettle();
  }
}
