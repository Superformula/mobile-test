import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/blocs/seed_bloc.dart';
import 'package:qr_app/pages/code/widgets/count_down_display.dart';

class MockSeedBloc extends Mock implements SeedBloc {}

class MockError extends Error {
  final message = 'Test Error';
}

void main() {
  final bloc = MockSeedBloc();

  Widget createWidget() {
    return Provider<SeedBloc>(
      create: (_) => bloc,
      child: MaterialApp(
        home: Scaffold(
          body: CountDownDisplay(),
        ),
      ),
    );
  }

  setUp(() {
    reset(bloc);
  });

  testWidgets('Retrieving seed data', (WidgetTester tester) async {
    when(bloc.countDownValue).thenAnswer((realInvocation) => null);
    await tester.pumpWidget(createWidget());
    expect(find.text('Retrieving seed data'), findsOneWidget);
  });
  testWidgets('Count down', (WidgetTester tester) async {
    when(bloc.countDownValue).thenAnswer((realInvocation) => Stream.value(10));
    await tester.pumpWidget(createWidget());
    await tester.pump();
    expect(find.text('10 Seconds'), findsOneWidget);
  });
  testWidgets('Error', (WidgetTester tester) async {
    when(bloc.countDownValue)
        .thenAnswer((realInvocation) => Stream.error(MockError()));
    await tester.pumpWidget(createWidget());
    await tester.pump();
    expect(find.text('Timer Error'), findsOneWidget);
  });
}
