import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qrcodevalidator/app/widgets/countdown_widget.dart';

void main() {
  testWidgets('CountdownWidget displays correct 2 units seconds',
      (WidgetTester tester) async {
    const int expectedSeconds = 12;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CountdownWidget(
          remainingTime: const Duration(seconds: expectedSeconds),
        ),
      ),
    );

    final text = find.text('00:$expectedSeconds');

    expect(text, findsOneWidget);
  });

  testWidgets('CountdownWidget displays correct 1 unit seconds',
      (WidgetTester tester) async {
    const int expectedSecond = 1;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CountdownWidget(
          remainingTime: const Duration(seconds: expectedSecond),
        ),
      ),
    );

    final text = find.text('00:0$expectedSecond');

    expect(text, findsOneWidget);
  });

  testWidgets('CountdownWidget displays correct 2 units minutes',
      (WidgetTester tester) async {
    const int expectedMinutes = 12;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CountdownWidget(
          remainingTime: const Duration(minutes: expectedMinutes),
        ),
      ),
    );

    final text = find.text('$expectedMinutes:00');

    expect(text, findsOneWidget);
  });

  testWidgets('CountdownWidget displays correct 1 unit minutes',
      (WidgetTester tester) async {
    const int expectedMinute = 1;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CountdownWidget(
          remainingTime: const Duration(minutes: expectedMinute),
        ),
      ),
    );

    final text = find.text('0$expectedMinute:00');

    expect(text, findsOneWidget);
  });

  testWidgets('CountdownWidget displays correct 2 units hour',
      (WidgetTester tester) async {
    const int expectedHours = 12;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CountdownWidget(
          remainingTime: const Duration(hours: expectedHours),
        ),
      ),
    );

    final text = find.text('$expectedHours:00:00');

    expect(text, findsOneWidget);
  });

  testWidgets('CountdownWidget displays correct 1 unit hour',
      (WidgetTester tester) async {
    const int expectedHour = 1;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CountdownWidget(
          remainingTime: const Duration(hours: expectedHour),
        ),
      ),
    );

    final text = find.text('0$expectedHour:00:00');

    expect(text, findsOneWidget);
  });

  testWidgets('CountdownWidget displays correct hours, minutes and seconds',
      (WidgetTester tester) async {
    const expectedHours = 12;
    const expectedMinutes = 34;
    const expectedSeconds = 56;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CountdownWidget(
          remainingTime: const Duration(
            hours: expectedHours,
            minutes: expectedMinutes,
            seconds: expectedSeconds,
          ),
        ),
      ),
    );

    final text = find.text('$expectedHours:$expectedMinutes:$expectedSeconds');

    expect(text, findsOneWidget);
  });
}
