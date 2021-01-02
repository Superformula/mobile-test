import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_test/blocs/countdown/countdown.dart';
import 'package:test/test.dart';

class CounterMock extends Mock implements Counter {}

void main() {
  CountdownBloc countdownBloc;
  int totalSeconds;

  setUp(() {
    totalSeconds = 4;
    countdownBloc = CountdownBloc(counter: const Counter());
  });

  group("CountdownBloc", () {
    test("The initial state must be 'CountdownInitial'", () {
      expect(countdownBloc.state, CountdownInitial(0));
    });

    blocTest<CountdownBloc, CountdownState>(
        "Testing the ticking when the time left is positive",
        build: () => countdownBloc,
        act: (bloc) => bloc
          ..add(const CountdownTicked(duration: 3))
          ..add(const CountdownTicked(duration: 2))
          ..add(const CountdownTicked(duration: 1)),
        expect: const [
          CountdownInProgress(3),
          CountdownInProgress(2),
          CountdownInProgress(1),
        ]);

    blocTest<CountdownBloc, CountdownState>(
        "Testing the ticking when the time arrives at zero",
        build: () => countdownBloc,
        act: (bloc) => bloc
          ..add(const CountdownTicked(duration: 1))
          ..add(const CountdownTicked(duration: 0)),
        expect: const [CountdownInProgress(1), CountdownCompleted()]);

    blocTest<CountdownBloc, CountdownState>(
        "Testing the finish of the countdown",
        build: () => countdownBloc,
        act: (bloc) => bloc.add(CountdownStopped()),
        expect: const [
          CountdownInitial(0),
        ]);

    blocTest<CountdownBloc, CountdownState>("Testing the countdown flow",
        build: () {
          final Counter mockCounter = CounterMock();

          // Mocking the data flow
          when(mockCounter.periodicStream(totalSeconds))
              .thenAnswer((_) => Stream<int>.fromIterable([3, 2, 1, 0]));

          // Returning the mocked instance
          return CountdownBloc(counter: mockCounter);
        },
        act: (bloc) => bloc.add(CountdownStarted(duration: totalSeconds)),
        expect: const [
          CountdownInProgress(4),
          CountdownInProgress(3),
          CountdownInProgress(2),
          CountdownInProgress(1),
          CountdownCompleted()
        ]);
  });
}