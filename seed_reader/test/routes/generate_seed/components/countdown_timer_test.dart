import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:seed_reader/components/countdown_timer.dart';
import '../../../common/base_testable_widget.dart';

late _OnFinishMock _onFinishMock;
void main() {
  setUp(() {
    _onFinishMock = _OnFinishMock();
  });
  testWidgets('render components', (WidgetTester tester) async {
    final Map<String, Duration> durations = <String, Duration>{
      '20:10:02s': const Duration(
        hours: 20,
        minutes: 10,
        seconds: 2,
      ),
      '02:10:02s': const Duration(
        hours: 2,
        minutes: 10,
        seconds: 2,
      ),
      '10:02s': const Duration(
        minutes: 10,
        seconds: 2,
      ),
      '02s': const Duration(
        seconds: 2,
      ),
      '00s': Duration.zero,
    };
    for (final MapEntry<String, Duration> entry in durations.entries) {
      await tester.pumpComponent(duration: entry.value);
      expect(find.text(entry.key), findsOneWidget);
    }
  });
  testWidgets('when the duration is negative then default to zero',
      (WidgetTester tester) async {
    await tester.pumpComponent(
      duration: const Duration(seconds: -1),
    );

    verify(_onFinishMock.onFinish()).called(1);
  });
}

class _OnFinishMock extends Mock {
  void onFinish();
}

extension _Pump on WidgetTester {
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

    await pump();
  }
}
