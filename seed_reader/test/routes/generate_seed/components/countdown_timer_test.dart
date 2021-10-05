import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:seed_reader/routes/generate_seed/components/countdown_timer.dart';
import '../../../common/base_testable_widget.dart';

void main() {
  testWidgets('render components', (WidgetTester tester) async {
    final _OnFinishMock mock = _OnFinishMock();
    await tester.pumpWidget(
      BaseWidgetTest(
        child: CountDownTimer(
          duration: const Duration(milliseconds: 300),
          onFinish: mock.onFinish,
        ),
      ),
    );

    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump(const Duration(milliseconds: 400));

    verify(mock.onFinish()).called(1);
  });
  testWidgets('when the duration is negative then default to zero',
      (WidgetTester tester) async {
    final _OnFinishMock mock = _OnFinishMock();
    await tester.pumpWidget(
      BaseWidgetTest(
        child: CountDownTimer(
          duration: const Duration(seconds: -1),
          onFinish: mock.onFinish,
        ),
      ),
    );

    await tester.pump();

    verify(mock.onFinish()).called(1);
  });
}

class _OnFinishMock extends Mock {
  void onFinish();
}
