import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:seed_reader/interactors/seed_interactor.dart';
import 'package:seed_reader/models/seed.dart';
import 'package:seed_reader/routes/generate_seed/generate_seed_page.dart';
import 'package:seed_reader/routes/generate_seed/generate_seed_page_bloc.dart';
import 'package:seed_reader/routes/generate_seed/generate_seed_route.dart';
import '../../common/base_testable_widget.dart';
import '../../mocks/mock_generator.mocks.dart';

late MockSeedInteractor _seedInteractor;
late GenerateSeedRoute _route;

void main() {
  setUp(() async {
    _seedInteractor = MockSeedInteractor();
    when(_seedInteractor.fetchSeed()).thenAnswer(
      (_) => Future<Seed>.value(
        Seed(
          expiration: DateTime.now().add(const Duration(seconds: 2)),
          value: 'foobar',
        ),
      ),
    );

    await GetIt.I.reset();
    GetIt.I.registerSingleton<SeedInteractor>(_seedInteractor);
    _route = const GenerateSeedRoute();
  });

  testWidgets('#canHandle', (WidgetTester tester) async {
    expect(_route.canHandle('/foo'), false);
    expect(_route.canHandle('/generate_seed'), true);
  });
  testWidgets('#handle', (WidgetTester tester) async {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

    await tester.pumpWidget(
      MultiProvider(
        providers: <SingleChildWidget>[
          Provider<GenerateSeedPageBloc>(
            create: (_) => GenerateSeedPageBloc(
              seedInteractor: _seedInteractor,
            ),
          ),
          StreamProvider<Seed?>(
            create: (_) => const Stream<Seed?>.empty(),
            initialData: null,
          ),
        ],
        child: BaseWidgetTest(
          navigatorKey: navigatorKey,
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    navigatorKey.currentState?.push<dynamic>(
      _route.handle<dynamic>(
        const RouteSettings(),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.byType(GenerateSeedPage), findsOneWidget);
    verify(_seedInteractor.fetchSeed()).called(1);
  });
}
