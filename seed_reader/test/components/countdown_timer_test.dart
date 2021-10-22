import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:seed_reader/components/countdown_timer.dart';
import '../common/base_testable_widget.dart';

late _OnFinishMock _onFinishMock;
void main() {
  setUp(() {
    _onFinishMock = _OnFinishMock();
  });
  testWidgets('render two digits hours', (WidgetTester tester) async {
    await tester.assertRenderTime(
      expected: '20:10:02s',
      duration: const Duration(
        hours: 20,
        minutes: 10,
        seconds: 2,
      ),
    );
  });
  testWidgets('render one digits hour', (WidgetTester tester) async {
    await tester.assertRenderTime(
      expected: '02:10:02s',
      duration: const Duration(
        hours: 2,
        minutes: 10,
        seconds: 2,
      ),
    );
  });
  testWidgets('render minutes', (WidgetTester tester) async {
    await tester.assertRenderTime(
      expected: '10:02s',
      duration: const Duration(
        minutes: 10,
        seconds: 2,
      ),
    );
  });
  testWidgets('render zero time', (WidgetTester tester) async {
    await tester.assertRenderTime(
      expected: '00s',
      duration: Duration.zero,
    );
  });

  testWidgets('when the duration is negative then default to zero',
      (WidgetTester tester) async {
    await tester.pumpComponent(
      duration: const Duration(seconds: -1),
    );
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));

    verify(_onFinishMock.onFinish()).called(1);
  });
}

class _OnFinishMock extends Mock {
  void onFinish();
}

extension _Pump on WidgetTester {
  Future<void> assertRenderTime({
    required String expected,
    required Duration duration,
  }) async {
    await pumpComponent(duration: duration);
    await pump(duration);
    expect(find.text(expected), findsOneWidget);
  }

  Future<void> pumpComponent({
    required Duration duration,
  }) async {
    await pumpWidget(
      BaseWidgetTest(
        child: TickerMode(
          enabled: false,
          child: CountDownTimer(
            key: UniqueKey(),
            duration: duration,
            onFinish: _onFinishMock.onFinish,
          ),
        ),
      ),
    );
  }
}
