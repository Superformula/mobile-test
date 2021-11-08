import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:generator/generate_code/generate.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  testWidgets('finds a Widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: GeneratePage()));
    expect(find.byType(QrImage), findsOneWidget);
  });
}
