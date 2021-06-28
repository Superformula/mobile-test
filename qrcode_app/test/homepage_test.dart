import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qrcode_app/main.dart';
import 'package:qrcode_app/presentation/seed_presenter.dart';

void main() {
  testWidgets('Screen starts with no qr code', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    const testKey = Key('qrcode');
    expect(find.byKey(testKey), findsNothing);
    await tester.pump();
  });

  testWidgets('check if icon + is on the screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byIcon(Icons.add), findsOneWidget);
    await tester.pump();
  });

  testWidgets(
      'check if scan icon and camera icon is on the screen after tap + icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byIcon(Icons.add), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    expect(find.byIcon(Icons.code_sharp), findsOneWidget);
    expect(find.byIcon(Icons.linked_camera), findsOneWidget);
  });
}
