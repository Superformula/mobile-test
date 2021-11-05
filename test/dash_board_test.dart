import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sf_qr_code/home/dashboard_page.dart';

void main() {
  testWidgets('Dashboard widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DashboardPage()));
    await tester.pumpAndSettle( Duration(seconds: 500));
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('QR Code'), findsOneWidget);
    expect(find.text('Scan Page'), findsOneWidget);
  });
}
