import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:seed_reader/components/countdown_timer.dart';
import 'package:seed_reader/generated/l10n.dart';
import 'package:seed_reader/models/seed.dart';

import 'package:seed_reader/routes/generate_seed/generate_seed_page.dart';
import 'package:seed_reader/routes/generate_seed/generate_seed_page_bloc.dart';
import '../../common/base_testable_widget.dart';
import '../../mocks/mock_generator.mocks.dart';

late MockSeedInteractor _seedInteractor;
void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;
  binding.window.physicalSizeTestValue = const Size(300, 400);
  binding.window.devicePixelRatioTestValue = 1.0;

  setUp(() {
    _seedInteractor = MockSeedInteractor();
  });
  testWidgets('render components', (WidgetTester tester) async {
    when(_seedInteractor.fetchSeed()).thenAnswer(
      (_) => Future<Seed>.value(
        Completer<Seed>().future,
      ),
    );
    await tester.pumpPage();

    expect(find.text(S.current.generateSeedPageTitle), findsOneWidget);
  });

  testWidgets(
    'when fails to fetch seed then renders error state',
    (WidgetTester tester) async {
      when(_seedInteractor.fetchSeed()).thenAnswer(
        (_) => Future<Seed>.error('something get wrong'),
      );
      await tester.pumpPage();

      expect(find.text(S.current.generateSeedErrorMessage), findsOneWidget);
      expect(find.text(S.current.generateSeedErrorTryAgain), findsOneWidget);
      expect(find.byType(CountDownTimer), findsOneWidget);
    },
  );

  testWidgets('when fetchs seed then render success state',
      (WidgetTester tester) async {
    final Completer<Seed> completer = Completer<Seed>();
    when(_seedInteractor.fetchSeed()).thenAnswer((_) => completer.future);
    await tester.pumpPage();

    // Loading state
    expect(find.text(S.current.generateSeedLoadingLabel), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Success state
    completer.complete(
      Seed(
        value: 'value',
        expiration: DateTime.now(),
      ),
    );
    await tester.pump();

    expect(find.byType(CountDownTimer), findsOneWidget);
    expect(find.byType(QrImage), findsOneWidget);
    verify(_seedInteractor.fetchSeed()).called(2);
  });
}

extension _Pump on WidgetTester {
  Future<void> pumpPage() async {
    await pumpWidget(
      BaseWidgetTest(
        child: MultiProvider(
          providers: <SingleChildWidget>[
            Provider<GenerateSeedPageBloc>(
              create: (_) => GenerateSeedPageBloc(
                seedInteractor: _seedInteractor,
              )..refreshSeed(),
            ),
          ],
          child: const GenerateSeedPage(),
        ),
      ),
    );

    await pump();
    await pump();
  }
}
