import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/widgets/timer_text.dart';

import '../helpers/pump_app.dart';

void main() {
  test('formatTime returns a formatted date time', () {
    const duration = Duration(hours: 1, minutes: 3, seconds: 6);
    expect(formatTime(duration.inSeconds), '01:03:06');
  });

  test('formatTime returns a formatted date time with only', () {
    const duration = Duration(minutes: 5, seconds: 16);
    expect(formatTime(duration.inSeconds), '05:16');
  });

  testWidgets('shows CountDownTimerText', (widgetTester) async {
    const duration = Duration(seconds: 6);
    await widgetTester.pumpApp(
      Material(
        child: CountDownTimerText(
          remainingTime: duration.inSeconds,
          onTimerFinish: () {},
        ),
      ),
    );
    final timerText = find.byKey(const Key('time_text'));
    expect(timerText, findsOneWidget);
  });
}
